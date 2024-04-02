<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!-- ======= Sidebar ======= -->
<aside id="sidebar" class="sidebar">
    <ul class="sidebar-nav" id="sidebar-nav">
        <li class="nav-item">
            <a class="nav-link collapsed" href="admin">
                <i class="bi bi-grid"></i>
                <span>Admin</span>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link collapsed" href="productmanagement">
                <i class="bi bi-menu-button-wide"></i>
                <span>Product Management</span>
            </a>
        </li>
        
        <c:if test="">
            <li class="nav-item">
                <a class="nav-link collapsed" href="User.jsp">
                    <i class="bi bi-person"></i>
                    <span>User Management</span>
                </a>
            </li> 
        </c:if>
        <li class="nav-item">
            <a class="nav-link collapsed" href="Invoice.jsp">
                <i class="bi bi-receipt-cutoff"></i>
                <span>Invoice Management</span>
            </a>
        </li> 
    </ul>
</aside><!-- End Sidebar-->