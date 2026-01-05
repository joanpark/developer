<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>

<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="com.google.appengine.api.datastore.DatastoreServiceFactory" %>
<%@ page import="com.google.appengine.api.datastore.DatastoreService" %>
<%@ page import="com.google.appengine.api.datastore.Query" %>
<%@ page import="com.google.appengine.api.datastore.Entity" %>
<%@ page import="com.google.appengine.api.datastore.FetchOptions" %>
<%@ page import="com.google.appengine.api.datastore.Key" %>
<%@ page import="com.google.appengine.api.datastore.KeyFactory" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
    

<%
	class Book
	{
		String name;
		int price;
		boolean available;
		public Book(String _name, int _price, boolean _available)
		{
			name = _name;
			price = _price;
			available = _available;
		}
	}


	//String cloudDataName = req.getParameter("cloudDataName");
	List<Book> books = new ArrayList<Book>();
	books.add(new Book("test test", 500, true));
	books.add(new Book("test hoahoaf", 50, true));
	books.add(new Book("test 3413431", 100, false));
	
	Map<String, Object> model = new HashMap<String, Object>();
	model.put("books", books);
	model.put("pageName", "Jade Test");
	
	//String html = Jade4J.render("./jade_res/test.jade", model);
	//Gson gson = new Gson();
	//String testStr = gson.toJson(model);		

	


%>

<ol id=<%= "books" %>>
<%

List<Book> tempList = (List<Book>) model.get("books");

for(Book book : tempList )
{
	if( book.available )
	{
	%> <li><%= book.name + " for " + book.price  %>   </li><%
	}
}


%>
</ol>
