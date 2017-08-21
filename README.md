# localstack-demo

Demonstrate an error response with localstack lamba invoke, where it apparently cannot invoke nodejs functions (at least those created via zip).

## Install
```
$ ./install.sh
```

## Run
```
$ ./test.sh
```

### Expected Results
Successfully execute function, and log "Executed successfully"

### Actual Results
```
Stopping localstackdemo_localstack_1 ... done
Removing localstackdemo_localstack_1 ... done
Removing network localstackdemo_default
WARNING: The Docker Engine you're using is running in swarm mode.

Compose does not use swarm mode to deploy services to multiple nodes in a swarm. All containers will be scheduled on the current node.

To deploy your application across the swarm, use `docker stack deploy`.

Creating network "localstackdemo_default" with the default driver
Creating localstackdemo_localstack_1 ...
Creating localstackdemo_localstack_1 ... done
updating: index.js (deflated 16%)

An error occurred (Exception) when calling the Invoke operation: Error executing Lambda function: Unable to find executor for Lambda function "testfn". Note that Node.js Lambdas currently require LAMBDA_EXECUTOR=docker Traceback (most recent call last):
  File "/opt/code/localstack/localstack/services/awslambda/lambda_api.py", line 293, in run_lambda
    process.run()
  File "/usr/lib/python2.7/multiprocessing/process.py", line 114, in run
    self._target(*self._args, **self._kwargs)
  File "/opt/code/localstack/localstack/services/awslambda/lambda_api.py", line 289, in do_execute
    result = func(event, context)
  File "/opt/code/localstack/localstack/services/awslambda/lambda_api.py", line 367, in generic_handler
    'Note that Node.js Lambdas currently require LAMBDA_EXECUTOR=docker') % lambda_name)
Exception: Unable to find executor for Lambda function "testfn". Note that Node.js Lambdas currently require LAMBDA_EXECUTOR=docker
```
