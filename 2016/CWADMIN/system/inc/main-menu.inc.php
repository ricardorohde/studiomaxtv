<header class="main-header">
    <!-- Logo -->
    <a href="painel.php" class="logo"><b>CW</b> Admin</a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top" role="navigation">
        <!-- Sidebar toggle button-->
        <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
        </a>
        <!-- Navbar Right Menu -->
        <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
                <!-- User Account: style can be found in dropdown.less -->
                <li class="dropdown user user-menu">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <img src="../uploads/<?= $userlogin['foto']; ?>" class="user-image" alt="User Image"/>
                        <span class="hidden-xs"><?= $userlogin['nome']; ?></span>
                    </a>
                    <ul class="dropdown-menu">
                        <!-- User image -->
                        <li class="user-header">
                            <img src="../uploads/<?= $userlogin['foto']; ?>" class="img-circle" alt="User Image" />
                            <p>
                                <?= $userlogin['nome']; ?> - Administrador
                                <small>Último acesso em <?= date('d/m/Y h:m:s', strtotime($userlogin['ultimo_acesso'])); ?></small>
                            </p>
                        </li>

                        <!-- Menu Footer-->
                        <li class="user-footer">
                            <div class="pull-left">
                                <a href="painel.php?exe=usuarios/profile" class="btn btn-default btn-flat"><b class="fa fa-user"></b> Meu Perfil</a>
                            </div>
                            <div class="pull-right">
                                <a href="painel.php?logoff=true" class="btn btn-danger btn-flat"><b class="fa fa-sign-out"></b> Sair</a>
                            </div>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
</header>