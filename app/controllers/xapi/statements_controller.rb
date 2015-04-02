class Xapi::StatementsController < Xapi::BaseController

  # GET /statements
  # get a single statement or multiple statements
  def show
    pp params
  end

  # POST /statements
  # stores a statement or set of statements
  # This is used if a statement doesn't have client generated ID
  def create
    statement = Statement.create({lrs: @lrs, statement: statement_parameters})
    if statement.valid?
      @statement_ids = [statement.statement[:id]]
    else
      render json: {error: true, success: false, message: statement.errors[:statement].join('. '), code: 400}, status: :bad_request
    end
  end

  # PUT /statements
  # stores a statement with the given statementId
  def update
    statement = Statement.create({lrs: @lrs, statement: statement_parameters})
    if statement.valid?
      render status: :no_content
    else
      render json: {error: true, success: false, message: statement.errors[:statement].join('. '), code: 400}, status: :bad_request
    end
  end

  private

  def statement_parameters
    params.select {|k,v| ['id', 'actor', 'verb', 'object', 'result', 'context', 'timestamp', 'stored', 'authority', 'version', 'attachments'].include?(k) }
  end

end
