<%@tag description="Overall Page template" pageEncoding="UTF-8"%>
<%@attribute name="header" fragment="true" %>
<%@attribute name="footer" fragment="true" %>
<html>
<head>
<title>
	WELCOME TO ICSSE 2017
</title><link href="CSS/show_img.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="Portlets/PanelBar/jquery-1.7.2.min.js"></script>
    <script src="Scripts/Common.js" type="text/javascript"></script>
    <script src="Scripts/PagingContent.js" type="text/javascript"></script>
<link rel="shortcut icon" type="image/png" href="Resources/Imagephoto/logo.png" /><link href="Components/lightbox/css/lightbox.css" rel="stylesheet" type="text/css" />
    <script src="Components/lightbox.min.js" type="text/javascript"></script>
    <link href="CSS/search_Article.css" rel="stylesheet" />
    
    <script language="javascript" type="text/javascript">
        function SearchProcess(event) {
            if (event.keyCode == 13) {
                OnSearch(document.getElementById('txtSearchArticle').value);
                return false;
            }
            return true;
        }
        function OnSearch(query) {
            PSCPortal.Services.CMS.SearchAndPaging(query, currentPage, OnSearchSuccess, OnSearchFailed);
        }

        function OnSearchSuccess(results, context, methodName) {
            var position = results.indexOf('_');
            totalRecords = results.substring(0, position);
            results = results.substring(position + 1);
            LoadContentAndPaging(results);
        }
        function OnSearchFailed(results, context, methodName) {
        }

        function retitleUrl(str) {
            str = str.replace(/^\s+|\s+$/g, ''); // trim
            str = str.toLowerCase();
            // remove accents, swap ñ for n, etc
            var from = "àáảãạăằắẳẵặâầấẩẫậđèéẻẽẹêềếểễệìíỉĩịòóỏõọôồốổỗộơờớởỡợùúủũụưừứửữựỳýỷỹỵ·/_,:;";
            var to = "aaaaaaaaaaaaaaaaadeeeeeeeeeeeiiiiiooooooooooooooooouuuuuuuuuuuyyyyy------";
            for (var i = 0, l = from.length ; i < l ; i++) {
                str = str.replace(new RegExp(from.charAt(i), 'g'), to.charAt(i));
            }
            str = str.replace(/[^a-z0-9 -]/g, '') // remove invalid chars
              .replace(/\s+/g, '-') // collapse whitespace and replace by -
              .replace(/-+/g, '-'); // collapse dashes
            return str;
        };

        function popunder() {
            $('a').not('[href^="http"],[href^="https"],[href^="mailto:"],[href^="#"]').each(function () {
                $(this).attr('href', function (index, value) {
                    if (value != undefined) {
                        var index = value.indexOf("Default.aspx");
                        if (index >= 0)
                            return value = "/" + value.substring(index, value.length);
                    }
                });
            });
            var articleId = '' != '' ? '' : '';
            var topicId = '' != '' ? '' : '';
            var moduleId = '' != '' ? '' : '';
            if (articleId != '') {
                if (window.history.state == null) {
                    if (articleId.indexOf("/") > -1)
                        articleId = articleId.substr(0, articleId.indexOf("/"));
                    window.history.replaceState({ ArticleId: articleId }, "ArticleId", "/ArticleId/" + articleId + "/" + retitleUrl(''));
                }
            }
            if (topicId != '') {
                if (window.history.state == null) {
                    if (topicId.indexOf("/") > -1)
                        topicId = topicId.substr(0, topicId.indexOf("/"));
                    window.history.replaceState({ TopicId: topicId }, "TopicId", "/TopicId/" + topicId + "/" + retitleUrl(''));
                }
            }
            
        }
    </script>


<link href="WebResources/WebResource.axd(1)" type="text/css" rel="stylesheet" class="Telerik_stylesheet" /><link href="WebResources/WebResource.axd(2)" type="text/css" rel="stylesheet" class="Telerik_stylesheet" /><link href="WebResources/WebResource.axd(3)" type="text/css" rel="stylesheet" class="Telerik_stylesheet" /></head>
<body class="body" onload='popunder();'>
<form name="form1" method="post" action="" id="form1">
	<div id="body1">
      <jsp:doBody/>
    </div>
    <div id="footer">
      <jsp:invoke fragment="footer"/>
    </div>
    </form>
</body>
</html>
