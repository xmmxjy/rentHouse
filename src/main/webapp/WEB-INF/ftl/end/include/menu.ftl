<nav class="navbar-default navbar-static-side" role="navigation" style="z-index: 1991;">
    <div class="nav-close"><i class="fa fa-times-circle"></i></div>
    <div class="slimScrollDiv" style="position: relative; width: auto; height: 100%;">
        <div class="sidebar-collapse" style="width: auto; height: 100%;">
            <ul class="nav" id="side-menu">
                <li class="nav-header">
                    <div class="dropdown profile-element">
                        <span><img alt="image" class="img-circle" src="${basePath}/plug-in-ui/hplus/img/profile_small.jpg"></span>
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <span class="clear">
                               <span class="block m-t-xs"><strong class="font-bold"></strong></span>
							   <span class="text-muted text-xs block">${currentUser.username}<b class="caret"></b></span>
                            </span>
                        </a>
                        <ul class="dropdown-menu animated fadeInRight m-t-xs">
                            <li><a href="${basePath}/logout.do">注销</a></li>
                        </ul>
                    </div>
                    <div class="logo-element" style="font-size: 15px;">java后台</div>
                </li>
                <#list functionList as function>
                <li class="active">
                    <a href="#" class="">
                        <i class="fa fa-columns"></i>
                        <span class="menu-text">${function.functionname}</span>
                        <span class="fa arrow"></span>
                    </a>

                    <ul class="nav nav-second-level collapse">
                        <#list subFunctionList as subFunction>

                            <#if function.id ==subFunction.parentFunctionId>
                        <li>
                            <a class="J_menuItem" href="${subFunction.functionurl}" data-index="0">${subFunction.functionname}</a>
                        </li>
                            </#if>
                        </#list>
                    </ul>
                </li>
                </#list>
            </ul>
        </div>
        <div class="slimScrollBar"
             style="width: 4px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 631.935px; background: rgb(0, 0, 0);"></div>
        <div class="slimScrollRail"
             style="width: 4px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; opacity: 0.9; z-index: 90; right: 1px; background: rgb(51, 51, 51);"></div>
    </div>
</nav><script type="text/javascript">
    /**加载主体页面**/
    function loadContent(url){
        //location.href="#navi";
        $("#center").attr("src",url);
    }
</script>
