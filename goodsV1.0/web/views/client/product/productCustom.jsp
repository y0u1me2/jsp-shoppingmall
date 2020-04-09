<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div style="display:none;">
<%@ include file="/views/client/common/header.jsp" %>
</div>
<!-- <!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>0. Design</title>
    <link rel="shortcut icon" href="#"> -->
    <link type="text/css" href="https://uicdn.toast.com/tui-color-picker/v2.2.3/tui-color-picker.css" rel="stylesheet">
    <link type="text/css" href="<%=request.getContextPath() %>/api/toast/dist/tui-image-editor.css" rel="stylesheet">
    <style>
        @import url(http://fonts.googleapis.com/css?family=Noto+Sans);

        html,
        body {
        	width:1366px;
            height: 100%;
            margin: 0;
        }
    </style>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/fabric.js/3.6.0/fabric.js"></script>
    <script type="text/javascript"
        src="https://uicdn.toast.com/tui.code-snippet/v1.5.0/tui-code-snippet.min.js"></script>
    <script type="text/javascript" src="https://uicdn.toast.com/tui-color-picker/v2.2.3/tui-color-picker.js"></script>
    <script type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/1.3.3/FileSaver.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/api/toast/dist/tui-image-editor.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/api/toast/js/theme/white-theme.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/api/toast/js/theme/black-theme.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- </head> -->

<body>

    <div id="tui-image-editor-container"></div>
    
	<input type="hidden" id="color" value="<%=request.getParameter("colorType")%>">
	<input type="hidden" id="pNo" value="<%=request.getParameter("pNo")%>">
	
    <script>
        // Image editor
        var imageEditor = new tui.ImageEditor('#tui-image-editor-container', {
            includeUI: {
                loadImage: {
                    path: '<%=request.getContextPath() %>/images/product/<%=request.getParameter("imgFile")%>',
                    name: 'OriginalImage'
                },
                theme: whiteTheme, // or whiteTheme
                menu : ['draw', 'shape', 'icon', 'text', 'mask'],
                initMenu: 'mask',
                menuBarPosition: 'bottom'
            },
            cssMaxWidth: 500,
            cssMaxHeight: 500,
            usageStatistics: false
        });
        window.onresize = function () {
            imageEditor.ui.resizeEditor();
        }
        

        


    </script>
</body>

<div style="display:none;">
<%@ include file="/views/client/common/footer.jsp" %>
</div>