<?php
$search = filter_input(INPUT_POST, 's', FILTER_DEFAULT);
if (!empty($search)):
    $search = strip_tags(trim(urlencode($search)));
    header('Location: ' . HOME . '/busca/' . $search);
endif;
?>
<section class="wrapper-busca">
    <div class="busca-tit">Buscar</div>
    <div class="busca-form">
        <form name="search" action="" method="post">
            <input type="text" name="s" class="busca-input" placeholder="Digite o que deseja buscar. Ex. Tribuna Livre...">
            <button type="submit" name="searchSubmit" class="busca-btn"><span class="fa fa-search fa-2x"></span> Buscar</button>
        </form>
    </div>
</section>