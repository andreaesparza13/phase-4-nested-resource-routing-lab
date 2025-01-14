class ApplicationController < ActionController::API
   rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
   rescue_from ActiveRecord::RecordInvalid, with: :invalid_record

   private

   def record_not_found(error)
      render json: { message: error.message }, status: :not_found
   end

   def invalid_record(invalid)
      render json: { message: invalid.record.errors.full_messages }, status: :unprocessable_entity
   end
end
