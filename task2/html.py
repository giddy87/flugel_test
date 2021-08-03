
f = open('index.html','w')

message = """<html>
<head></head>
<body><p>Flugel Test</p>
<p>Tags are:</p>
<p>Name : Flugel</p>
<p> Owner: InfraTeam
</body>
</html>"""

f.write(message)
f.close()
