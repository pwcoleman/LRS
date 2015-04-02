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
    statement = Statement.create({statement: statement_parameters})
    @statement_ids = [statement.statement[:id]]
  end

  # PUT /statements
  # stores a statement with the given statementId
  def update
    @statement = Statement.create({statement: statement_parameters})
    render status: :no_content
  end

  private

  def statement_parameters
    params.select {|k,v| ['id', 'actor', 'verb', 'object', 'result', 'context', 'timestamp', 'stored', 'authority', 'version', 'attachments'].include?(k) }
  end

end
