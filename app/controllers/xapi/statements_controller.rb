# encoding: UTF-8
class Xapi::StatementsController < Xapi::BaseController

  # GET /statements
  # get a single statement or multiple statements
  def index
    pp '=============================='
    pp params
    pp '=============================='
    errors = check_query_parameters
    if errors.empty?
      if params[:statementId]
        @result = Statement.unvoided.where(statement_id: params[:statementId]).first
      elsif params[:voidedStatementId]
        @result = Statement.voided.where(statement_id: params[:statementId]).first
      else
        @results = Statement.unvoided.order_by(['statement.stored', :desc])
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
      statement = Statement.create_from(@lrs, statement_parameters)
      if statement.valid?
        @statement_ids = [statement.statement[:id]]
      else
        render json: {error: true, success: false, message: statement.errors[:statement].join('. '), code: 400}, status: :bad_request
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
    errors << 'Cannot have both statementId and voidedStatementId' if params['statementId'] && params['voidedStatementId']
    if params['statementId'] || params['voidedStatementId']
      excluded = %w(agent verb activity registration related_activities related_agents since until limit ascending)
      errors << 'Additional parameters not allowed when statementId or voidedStatementId present' if (params.keys & excluded).any?
    end
    errors
  end

end
