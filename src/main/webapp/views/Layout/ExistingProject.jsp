<%@page import="com.handsontech.beans.ProjectBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<div class="col l6 m6 s12">
	<div class="card medium">
		<div class="card-image waves-effect waves-block waves-light">
			<img class="activator" src="<c:url value='<%=""%>'/>">
		</div>
		<div class="card-content">
			<span class="card-title activator grey-text text-darken-4">
				${projectVar.pCity}<i class="material-icons right">more_vert</i>
			</span>
			<p>
				<a href="#">Open Project</a>
			</p>
		</div>
		<div class="card-reveal">
			<span class="card-title grey-text text-darken-4">Project Info<i
				class="material-icons right">close</i>
			</span>
			<!-- add word wrap if necessary -->
			<p>Here is some more information about this product that is only
				revealed once clicked on.Here is some more information about this
				product that is only revealed once clicked on.Here is some more
				information about this product that is only revealed once clicked
				on.Here is some more information about this product that is only
				revealed once clicked on.Here is some more information about this
				product that is only revealed once clicked on.</p>
		</div>
		<div class="card-action">
			<a href="#">This is a link</a>
		</div>
	</div>
</div>