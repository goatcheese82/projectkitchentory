require_relative "./config/environment"

use Rack::MethodOverride
use UserController
use SessionController
use InventoryController
run ApplicationController
