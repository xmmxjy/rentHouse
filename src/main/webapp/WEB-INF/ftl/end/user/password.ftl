<!DOCTYPE html>
<html>
<head th:replace="end/include/head">
<body style='overflow:scroll;overflow-x:hidden'>
<div class="container bs-docs-container" style="width:100%;">
	<div class="row">
		<div class="panel panel-default">
			<div class="panel-heading">修改</div>
			<div class="panel-body">
				<form class="form-horizontal" role="form" id="dailogForm" action="${basePath}/user/doPassword.do" method="POST">
					<input type="hidden" id="btn_sub" class="btn_sub" />
					<input type="hidden" th:value="${user.id}" name="id"/>
					<div class="form-group mno">
						<label for="username" class="col-sm-2 control-label" style="text-align:left;">用户名</label>
						<div class="col-sm-8">
							<input type="text" th:value="${user.username}" name="username" id="username" class="form-control"  readonly="true"/>
						</div>
					</div>

					<div class="form-group mno">
						<label for="password" class="col-sm-2 control-label" style="text-align:left;" >旧密码</label>
						<div class="col-sm-8">
							<input type="password" name="password" id="password" class="form-control" datatype="*5-16"/>
						</div>
					</div>
					<div class="form-group mno">
						<label for="newPassword" class="col-sm-2 control-label" style="text-align:left;" >新密码密码</label>
						<div class="col-sm-8">
							<input type="password" name="newPassword" id="newPassword" class="form-control" datatype="*5-16" nullmsg="请设置密码！" errormsg="密码范围在6~16位之间！"/>
						</div>
					</div>
					<div class="form-group mno">
						<label for="confirmPassword" class="col-sm-2 control-label" style="text-align:left;" >确认密码</label>
						<div class="col-sm-8">
							<input type="password" name="confirmPassword" id="confirmPassword" class="form-control" datatype="*" recheck="newPassword" nullmsg="请再输入一次密码！" errormsg="您两次输入的密码不一致！"/>
						</div>
					</div>
					<div class="form-group mno">
						<div class="col-sm-offset-1 col-sm-6">
							<button type="button" class="btn btn-default" id="formReturn" data-dismiss="modal" onclick="doUrl('${basePath}/user/list.do}');">返回</button>
							<button type="button" class="btn btn-primary" id="formSubmit">提交</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
</body>
</html>
<script type="text/javascript" src="${base}/plug-in-ui/project/js/Validform_v5.3.2.js"></script>
<script type="text/javascript" src="${base}/plug-in-ui/project/js/forminit.p3.js"></script>
