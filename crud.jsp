<!DOCTYPE html>
<html>

<head>
	<meta charset="ISO-8859-1">
	<title>Insert title here</title>
	<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<style>
	body {
    font-family: Arial, sans-serif;
    background-color: #f2f2f2;
}

center {
    margin-top: 50px;
}

button {
    padding: 5px 10px;
    margin: 5px;
}

input[type="text"],
select {
    padding: 5px;
    margin: 5px;
}

</style>
</head>
<br>
<center>
	<h1>CRUD</h1>
	<label>Name :<input type="text" id="name"></label><select id="select">
		<option>select</option>
		<option>Add</option>
		<option>Edit</option>
		<option>Delete</option>
	</select><br></br>
	<label>Age :<input type="text" id="age"></label><br></br>
	<label>Salary:<input type="text" id="salary"></label><br></br>
	<label>Job :<input type="text" id="job"></label><br></br>
	<label>Dept :<input type="text" id="dept"></label><br></br>
	<button id="first" onclick="first()">First</button>
	<button id="last" onclick="last()">Last</button>
	<button id="prev" onclick="prev()">Prev</button>
	<button id="next" onclick="next()">Next</button><br></br>
	<button id="add" onclick="add()" value="Add">Add</button>
	<button id="edit" onclick="edit()">Edit</button>
	<button id="delete" onclick="delete1()">Delete</button><br></br>
	<button id="save" onclick="save1()">Save</button>
	<button id="clear" onclick="clear1()">Clear</button>
	<button id="exit" onclick="exit()">Exit</button>
</center>
<%
	String key=response.getHeader("key");
	String user=response.getHeader("user");
	System.out.println(key+" "+user);
	%>
<script>
	var pos = 0;
	var epos = 0;
	function first() {
		pos=1;
		epos = 1;
		var xhr = new XMLHttpRequest();
		xhr.open('GET', 'EmployeeServlet?id=first', true);
		xhr.setRequestHeader('key', '<%=key%>');
		xhr.setRequestHeader('user', '<%=user%>');
		xhr.onreadystatechange = function () {
			if (xhr.readyState === 4) {
				var data = JSON.parse(xhr.responseText);
				var name = document.getElementById('name');
				var age = document.getElementById('age');
				var sal = document.getElementById('salary');
				var job = document.getElementById('job');
				var dept = document.getElementById('dept');
				console.log(data);
				name.value = data.name;
				age.value = data.age;
				sal.value = data.sal;
				job.value = data.job;
				dept.value = data.dept;
			}
		}
		xhr.send();
	}
	function last() {
		var xhr = new XMLHttpRequest();
		xhr.open('GET', 'EmployeeServlet?id=last', true);
		xhr.setRequestHeader('key', '<%=key%>');
		xhr.setRequestHeader('user', '<%=user%>');
		xhr.onreadystatechange = function () {
			if (xhr.readyState === 4) {
				var data = JSON.parse(xhr.responseText);
				var name = document.getElementById('name');
				var age = document.getElementById('age');
				var sal = document.getElementById('salary');
				var job = document.getElementById('job');
				var dept = document.getElementById('dept');
				var size = document.getElementById('size');
				name.value = data.name;
				age.value = data.age;
				sal.value = data.sal;
				job.value = data.job;
				dept.value = data.dept;
				epos = size + 1;
			}
		}
		xhr.send();
	}
	function prev() {
		var xhr = new XMLHttpRequest();
		pos = pos - 1;
		if (pos == -1) {
			pos = 0;
		}
		epos = pos + 1;
		xhr.open('GET', 'EmployeeServlet?id=prev&pos=' + pos, true);
		xhr.setRequestHeader('key', '<%=key%>');
		xhr.setRequestHeader('user', '<%=user%>');
		xhr.onreadystatechange = function () {
			if (xhr.readyState === 4) {
				var data = JSON.parse(xhr.responseText);
				var name = document.getElementById('name');
				var age = document.getElementById('age');
				var sal = document.getElementById('salary');
				var job = document.getElementById('job');
				var dept = document.getElementById('dept');
				name.value = data.name;
				age.value = data.age;
				sal.value = data.sal;
				job.value = data.job;
				dept.value = data.dept;
			}
		}
		xhr.send();
	}
	function next() {
		var xhr = new XMLHttpRequest();
		pos = pos + 1;
		epos = pos + 1;
		xhr.open('GET', 'EmployeeServlet?id=next&pos=' + pos, true);
		xhr.setRequestHeader('key', '<%=key%>');
		xhr.setRequestHeader('user', '<%=user%>');
		xhr.onreadystatechange = function () {
			if (xhr.readyState === 4) {
				var data = JSON.parse(xhr.responseText);
				var name = document.getElementById('name');
				var age = document.getElementById('age');
				var sal = document.getElementById('salary');
				var job = document.getElementById('job');
				var dept = document.getElementById('dept');
				name.value = data.name;
				age.value = data.age;
				sal.value = data.sal;
				job.value = data.job;
				dept.value = data.dept;
			}
		}
		xhr.send();
	}
	function add() {
		var sel = document.getElementById('select');
		sel.value = "Add";
	}
	function edit() {
		var sel = document.getElementById('select');
		sel.value = "Edit";
	}
	function delete1() {
		var sel = document.getElementById('select');
		sel.value = "Delete";
	}
	function save1() {
		var sss = document.getElementById('select').value;
		if (sss == "Add") {
			var name = document.getElementById('name').value;
			var age = document.getElementById('age').value;
			var sal = document.getElementById('salary').value;
			var job = document.getElementById('job').value;
			var dept = document.getElementById('dept').value;
			var adds = "&name=" + name + "&age=" + age + "&sal=" + sal + "&job=" + job + "&dept=" + dept;
			var xhr = new XMLHttpRequest();
			xhr.open('GET', 'EmployeeServlet?id=add' + adds, true);
			xhr.setRequestHeader('key', '<%=key%>');
			xhr.setRequestHeader('user', '<%=user%>');
			xhr.onreadystatechange = function () {
				if (xhr.readyState === 4) {
					console.log("hii bro");
				}
			}
			xhr.send();
		}
		if (sss = "Edit") {
			var name = document.getElementById('name').value;
			var age = document.getElementById('age').value;
			var sal = document.getElementById('salary').value;
			var job = document.getElementById('job').value;
			var dept = document.getElementById('dept').value;
			var edit = "&name=" + name + "&age=" + age + "&sal=" + sal + "&job=" + job + "&dept=" + dept + "&epos=" + epos;
			var xhr = new XMLHttpRequest();
			xhr.open('GET', 'EmployeeServlet?id=edit' + edit, true);
			xhr.setRequestHeader('key', '<%=key%>');
			xhr.setRequestHeader('user', '<%=user%>');
			xhr.onreadystatechange = function () {
				if (xhr.readyState === 4) {
					console.log("hii edit bro");
				}
			}
			xhr.send();
		}
		if (sss = "Delete") {
			var dpos = "&dpos=" + epos;
			var xhr = new XMLHttpRequest();
			xhr.open('GET', 'EmployeeServlet?id=delete' + dpos, true);
			xhr.setRequestHeader('key', '<%=key%>');
			xhr.setRequestHeader('user', '<%=user%>');
			xhr.onreadystatechange = function () {
				if (xhr.readyState === 4) {
					console.log("hii delete bro");
				}
			}
			xhr.send();
		}
	}
	function clear1() {
		var name = document.getElementById('name');
		var age = document.getElementById('age');
		var sal = document.getElementById('salary');
		var job = document.getElementById('job');
		var dept = document.getElementById('dept');
		name.value = "";
		age.value = "";
		sal.value = "";
		job.value = "";
		dept.value = "";
	}
	function exit() {
		console.log("exit");
		window.close();
		window.close();
	}


</script>
</body>

</html>