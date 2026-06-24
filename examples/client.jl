using RemoteFHE

result = RemoteFHE.run_client([0.5, 1.5, 2.5, 3.5], "http://127.0.0.1:8080")
println("Client finished. Result = ", result)