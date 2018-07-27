<div class="container mb-60">
	<div class="row mt-40">
		<div class="col-md-10 offset-2">
			<div class="row">
				<div class="col-md-10 space-between">
					<div class="title-1 mb-40 mt-0">Категории блога</div>
					<a class="button button--edit" href="<?=HOST?>blog/category-new">Добавить</a>
				</div>
			</div>


			<div class="row mb-10">
				<div class="col-md-10">
				<?php if (isset($_GET['result'])){include ROOT . 'templates/_parts/_results.tpl';}?>
				</div>
			</div>

			<div class="row">
				<div class="col-10">
					<table class="table table-striped text-center">
						<thead class = "thead-dark" >
							<tr>
								<th scope="col">#</th>
								<th scope="col">Название</th>
								<th scope="col">Редактировать</th>
								<th scope="col">Удалить</th>
							</tr>
						</thead>
						<tbody>
							<?php foreach ($categories as $category){?>
							
							<tr class="admin-nav__link title-6">
								<th scope="row"><?=$category['id']?></th>
								<td class="text-left"><?=$category['catTitle']?></td>
								<td scope="row">
									<a class="admin-nav__link" href="<?=HOST?>blog/category-edit?id=<?=$category['id']?>"><i class="far fa-edit"></i></a>
								</td>
								
								<td scope="row">
									<a class="admin-nav__link" href="<?=HOST?>blog/category-delete?id=<?=$category['id']?>"><i class="fas fa-trash-alt link__icon"></i></a>
								</td>
							</tr>
					
							<?}?>
						</tbody>
					</table>
				</div>
			</div>

		</div>
	</div>
</div>