# encoding: UTF-8
class Xapi::StatementsController < Xapi::BaseController

  # GET /statements
  # get a single statement or multiple statements
  def index
    errors = check_query_parameters
    if errors.empty?
      if params[:statementId]
        @result = Statement.unvoided.where(statement_id: params[:statementId]).first
      elsif params[:voidedStatementId]
        @result = Statement.voided.where(statement_id: params[:statementId]).first
      else
        query_parameters = request.query_parameters
        query = Statement.unvoided
        # TODO: Move these to scopes!!!
        # agent
        query = query.by_verb(query_parameters['verb']) if query_parameters['verb']
        query = query.by_activity(query_parameters['activity']) if query_parameters['activity']
        # registration
        # related_activities
        # related_agents
        # since
        # until
        # limit
        query = query.limit(query_parameters['limit']) if query_parameters['limit']
        # format
        # attachments
        # ascending
        query = query_parameters['ascending'] ? query.order_by(['statement.stored', :asc]) : query.order_by(['statement.stored', :desc])
        @results = query
      end
    else
      render json: {error: true, success: false, message: errors.join('. '), code: 400}, status: :bad_request
    end
  end

  # POST /statements
  # stores a statement or set of statements
  # This is used if a statement doesn't have client generated ID
  def create
    if params[:statementId]
      render json: {error: true, success: false, message: 'Statement ID parameter is invalid.', code: 400}, status: :bad_request
    elsif request.headers['Content-Type'] == 'application/json'
      # TODO :: HOW do we handle errors here?
      body =  JSON.parse(request.body.read)
      @statement_ids  = []
      errors = []
      if body.is_a?(Array)
        body.each do |s|
          statement = Statement.create_from(@lrs, s)
          if statement.valid?
            @statement_ids << statement.statement[:id]
          else
            errors << statement.errors[:statement].join('. ')
          end
        end
      else
        statement = Statement.create_from(@lrs, statement_parameters)
        if statement.valid?
          @statement_ids << statement.statement[:id]
        else
          render json: {error: true, success: false, message: statement.errors[:statement].join('. '), code: 400}, status: :bad_request
        end
      end

    else
      render json: {error: true, success: false, message: 'Invalid content type.', code: 400}, status: :bad_request
    end

  end

  # PUT /statements
  # stores a statement with the given statementId
  def update
    # TODO: Check the parameter
    # TODO: Check if statement exists and if so check if they are the same
    if params[:statementId]
      statement = Statement.create_from(@lrs, statement_parameters.merge({id: params[:statementId]}))
      if statement.valid?
        render status: :no_content
      else
        render json: {error: true, success: false, message: statement.errors[:statement].join('. '), code: 400}, status: :bad_request
      end
    else
      render json: {error: true, success: false, message: 'A statement ID is required to PUT.', code: 400}, status: :bad_request
    end
  end

  private

  def statement_parameters
    params.select {|k,v| ['id', 'actor', 'verb', 'object', 'result', 'context', 'timestamp', 'stored', 'authority', 'version', 'attachments'].include?(k) }
  end

  def check_query_parameters
    errors = []
    query_parameters = request.query_parameters
    errors << 'Cannot have both statementId and voidedStatementId' if query_parameters['statementId'] && query_parameters['voidedStatementId']
    if query_parameters['statementId'] || query_parameters['voidedStatementId']
      excluded = %w(agent verb activity registration related_activities related_agents since until limit ascending)
      errors << 'Additional parameters not allowed when statementId or voidedStatementId present' if (query_parameters.keys & excluded).any?
    else
      if query_parameters['agent']
        validator = AgentValidator.new({attributes: [:agent], class: State})
        state = State.new
        if query_parameters['agent'].is_a?(Hash)
          validator.validate_each(state, :agent, query_parameters['agent'])
        else
          begin
            agent = JSON.parse(query_parameters['agent'])
            validator.validate_each(state, :agent, agent)
          rescue
            errors << 'Invalid agent'
          end
        end
        errors.concat(state.errors[:agent])
      end
      if query_parameters['verb']
        errors << 'Invalid verb' unless validate_iri(query_parameters['verb'])
      end
      if query_parameters['activity']
        errors << 'Invalid activity' unless validate_iri(query_parameters['activity'])
      end
      if query_parameters['registration']
        errors << 'Invalid registration' unless validate_uuid(query_parameters['registration'])
      end
      if query_parameters['related_activities']
        errors << 'related_activities must be true or false' unless query_parameters['related_activities'].is_a?(Boolean) || query_parameters['related_activities'] =~ (/(true|false)$/i)
      end
      if query_parameters['related_agents']
        errors << 'related_agents must be true or false' unless query_parameters['related_agents'].is_a?(Boolean) || query_parameters['related_agents'] =~ (/(true|false)$/i)
      end
      if query_parameters['since']
        errors << 'since is invalid' unless validate_timestamp(query_parameters['since'])
      end
      if query_parameters['until']
        errors << 'until is invalid' unless validate_timestamp(query_parameters['until'])
      end
      if query_parameters['limit']
        errors << 'limit must be a positive number' unless validate_integer(query_parameters['limit'])
      end
      if query_parameters['format']
        errors << 'invalid format' unless %w(ids exact canonical).include?(query_parameters['format'])
      end
      if query_parameters['attachments']
        errors << 'attachments must be true or false' unless query_parameters['attachments'].is_a?(Boolean) || query_parameters['attachments'] =~ (/(true|false)$/i)
      end
      if query_parameters['ascending']
        errors << 'ascending must be true or false' unless query_parameters['ascending'].is_a?(Boolean) || query_parameters['ascending'] =~ (/(true|false)$/i)

      end
    end
    errors
  end

end
