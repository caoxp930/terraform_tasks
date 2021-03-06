resource "aws_lambda_function" "create_task_lambda" {
	function_name = "create_task"
	handler = "com.lcpoletto.tasks.CreateTask::handleRequest"
	role = "${aws_iam_role.rw_tasks_role.arn}"
	runtime = "java8"
	timeout = "15"
	memory_size = "512"
	
	s3_bucket = "${aws_s3_bucket.deploy_bucket.bucket}"
	s3_key = "${var.package_name}"
	depends_on = ["aws_s3_bucket_object.lambda_package"]
}

resource "aws_lambda_permission" "create_task_api_permission" {
    statement_id = "AllowExecutionFromAPIGateway"
    action = "lambda:InvokeFunction"
    function_name = "${aws_lambda_function.create_task_lambda.arn}"
    principal = "apigateway.amazonaws.com"
    # as terraform does not expose method arns we need to reconstruct them manually
    source_arn = "arn:aws:execute-api:${var.region}:${data.aws_caller_identity.current.account_id}:${aws_api_gateway_rest_api.tasks_api.id}/*/${aws_api_gateway_method.tasks_post_method.http_method}/tasks"
}

resource "aws_lambda_function" "delete_task_lambda" {
	function_name = "delete_task"
	handler = "com.lcpoletto.tasks.DeleteTask::handleRequest"
	role = "${aws_iam_role.rw_tasks_role.arn}"
	runtime = "java8"
	timeout = "15"
	memory_size = "512"
	
	s3_bucket = "${aws_s3_bucket.deploy_bucket.bucket}"
	s3_key = "${var.package_name}"
	depends_on = ["aws_s3_bucket_object.lambda_package"]
}

resource "aws_lambda_permission" "delete_task_api_permission" {
    statement_id = "AllowExecutionFromAPIGateway"
    action = "lambda:InvokeFunction"
    function_name = "${aws_lambda_function.delete_task_lambda.arn}"
    principal = "apigateway.amazonaws.com"
    # as terraform does not expose method arns we need to reconstruct them manually
    source_arn = "arn:aws:execute-api:${var.region}:${data.aws_caller_identity.current.account_id}:${aws_api_gateway_rest_api.tasks_api.id}/*/${aws_api_gateway_method.tasks_delete_method.http_method}/tasks/*"
}

resource "aws_lambda_function" "retrieve_task_lambda" {
	function_name = "retrieve_task"
	handler = "com.lcpoletto.tasks.RetrieveTask::handleRequest"
	role = "${aws_iam_role.ro_tasks_role.arn}"
	runtime = "java8"
	timeout = "15"
	memory_size = "512"
	
	s3_bucket = "${aws_s3_bucket.deploy_bucket.bucket}"
	s3_key = "${var.package_name}"
	depends_on = ["aws_s3_bucket_object.lambda_package"]
}

resource "aws_lambda_permission" "retrieve_task_api_permission" {
    statement_id = "AllowExecutionFromAPIGateway"
    action = "lambda:InvokeFunction"
    function_name = "${aws_lambda_function.retrieve_task_lambda.arn}"
    principal = "apigateway.amazonaws.com"
    # as terraform does not expose method arns we need to reconstruct them manually
    source_arn = "arn:aws:execute-api:${var.region}:${data.aws_caller_identity.current.account_id}:${aws_api_gateway_rest_api.tasks_api.id}/*/${aws_api_gateway_method.tasks_get_method.http_method}/tasks"
}

resource "aws_lambda_function" "send_task_lambda" {
	function_name = "send_task"
	handler = "com.lcpoletto.tasks.SendTask::handleRequest"
	role = "${aws_iam_role.send_tasks_role.arn}"
	runtime = "java8"
	timeout = "15"
	memory_size = "512"
	
	s3_bucket = "${aws_s3_bucket.deploy_bucket.bucket}"
	s3_key = "${var.package_name}"
	
	environment {
		variables = {
			TASKS_MAIL_FROM = "${var.mail_from}"
		}
	}
	
	depends_on = ["aws_s3_bucket_object.lambda_package"]
}

resource "aws_lambda_function" "update_task_lambda" {
	function_name = "update_task"
	handler = "com.lcpoletto.tasks.UpdateTask::handleRequest"
	role = "${aws_iam_role.rw_tasks_role.arn}"
	runtime = "java8"
	timeout = "15"
	memory_size = "512"
	
	s3_bucket = "${aws_s3_bucket.deploy_bucket.bucket}"
	s3_key = "${var.package_name}"
	depends_on = ["aws_s3_bucket_object.lambda_package"]
}

resource "aws_lambda_permission" "update_task_api_permission" {
    statement_id = "AllowExecutionFromAPIGateway"
    action = "lambda:InvokeFunction"
    function_name = "${aws_lambda_function.update_task_lambda.arn}"
    principal = "apigateway.amazonaws.com"
    # as terraform does not expose method arns we need to reconstruct them manually
    source_arn = "arn:aws:execute-api:${var.region}:${data.aws_caller_identity.current.account_id}:${aws_api_gateway_rest_api.tasks_api.id}/*/${aws_api_gateway_method.tasks_put_method.http_method}/tasks/*"
}

# note lambdas
resource "aws_lambda_function" "create_note_lambda" {
	function_name = "create_note"
	handler = "com.lcpoletto.notes.CreateNote::handleRequest"
	role = "${aws_iam_role.rw_tasks_role.arn}"
	runtime = "java8"
	timeout = "15"
	memory_size = "512"
	
	s3_bucket = "${aws_s3_bucket.deploy_bucket.bucket}"
	s3_key = "${var.package_name}"
	depends_on = ["aws_s3_bucket_object.lambda_package"]
}

resource "aws_lambda_permission" "create_note_api_permission" {
    statement_id = "AllowExecutionFromAPIGateway"
    action = "lambda:InvokeFunction"
    function_name = "${aws_lambda_function.create_note_lambda.arn}"
    principal = "apigateway.amazonaws.com"
    # as terraform does not expose method arns we need to reconstruct them manually
    source_arn = "arn:aws:execute-api:${var.region}:${data.aws_caller_identity.current.account_id}:${aws_api_gateway_rest_api.tasks_api.id}/*/${aws_api_gateway_method.notes_post_method.http_method}/notes"
}

resource "aws_lambda_function" "update_note_lambda" {
	function_name = "update_note"
	handler = "com.lcpoletto.notes.UpdateNote::handleRequest"
	role = "${aws_iam_role.rw_tasks_role.arn}"
	runtime = "java8"
	timeout = "15"
	memory_size = "512"
	
	s3_bucket = "${aws_s3_bucket.deploy_bucket.bucket}"
	s3_key = "${var.package_name}"
	depends_on = ["aws_s3_bucket_object.lambda_package"]
}

resource "aws_lambda_permission" "update_note_api_permission" {
    statement_id = "AllowExecutionFromAPIGateway"
    action = "lambda:InvokeFunction"
    function_name = "${aws_lambda_function.update_note_lambda.arn}"
    principal = "apigateway.amazonaws.com"
    # as terraform does not expose method arns we need to reconstruct them manually
    source_arn = "arn:aws:execute-api:${var.region}:${data.aws_caller_identity.current.account_id}:${aws_api_gateway_rest_api.tasks_api.id}/*/${aws_api_gateway_method.notes_put_method.http_method}/notes/*"
}

resource "aws_lambda_function" "send_note_lambda" {
	function_name = "send_note_update"
	handler = "com.lcpoletto.notes.SendNoteUpdate::handleRequest"
	role = "${aws_iam_role.send_note_update_role.arn}"
	runtime = "java8"
	timeout = "15"
	memory_size = "512"
	
	s3_bucket = "${aws_s3_bucket.deploy_bucket.bucket}"
	s3_key = "${var.package_name}"
	
	environment {
		variables = {
			TASKS_MAIL_FROM = "${var.mail_from}"
		}
	}
	
	depends_on = ["aws_s3_bucket_object.lambda_package"]
}

resource "aws_lambda_event_source_mapping" "send_note_lambda_trigger" {
	batch_size = 1
	event_source_arn = "${aws_dynamodb_table.notes_table.stream_arn}"
	enabled = true
	function_name = "${aws_lambda_function.send_note_lambda.arn}"
	starting_position = "LATEST"
}