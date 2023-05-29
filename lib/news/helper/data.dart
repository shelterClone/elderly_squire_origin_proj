import 'package:elderly_squire_capstone/news/models/category_model.dart';

List<CategoryModel> getCategories(){

  List <CategoryModel> category = new List<CategoryModel>();
  CategoryModel categoryModel = new CategoryModel();

  //1
//  categoryModel.categoryName = "Business";
//  categoryModel.imageUrl = "https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80";
//  category.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryName= "General";
//  categoryModel.imageUrl = "https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60";
  categoryModel.imageUrl = "https://imgs.search.brave.com/RJo9tSzNpVYkUyAK-Azq-Q9sxhAKc2zBqVlBnoe0VU8/rs:fit:1200:1200:1/g:ce/aHR0cHM6Ly93YWxs/cGFwZXJjYXZlLmNv/bS93cC93cDM0Mjk2/NzguanBn";
  category.add(categoryModel);

  //2
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Entertainment";
//  categoryModel.imageUrl = "https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  categoryModel.imageUrl = "https://imgs.search.brave.com/RJo9tSzNpVYkUyAK-Azq-Q9sxhAKc2zBqVlBnoe0VU8/rs:fit:1200:1200:1/g:ce/aHR0cHM6Ly93YWxs/cGFwZXJjYXZlLmNv/bS93cC93cDM0Mjk2/NzguanBn";
  category.add(categoryModel);

  //3

  //4
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Health";
//  categoryModel.imageUrl = "https://images.unsplash.com/photo-1494390248081-4e521a5940db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1595&q=80";
  categoryModel.imageUrl = "https://imgs.search.brave.com/RJo9tSzNpVYkUyAK-Azq-Q9sxhAKc2zBqVlBnoe0VU8/rs:fit:1200:1200:1/g:ce/aHR0cHM6Ly93YWxs/cGFwZXJjYXZlLmNv/bS93cC93cDM0Mjk2/NzguanBn";
  category.add(categoryModel);

  //5
//  categoryModel = new CategoryModel();
//  categoryModel.categoryName = "Science";
//  categoryModel.imageUrl = "https://images.unsplash.com/photo-1554475901-4538ddfbccc2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1504&q=80";
//  category.add(categoryModel);

  //5
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Sports";
  categoryModel.imageUrl = "https://imgs.search.brave.com/RJo9tSzNpVYkUyAK-Azq-Q9sxhAKc2zBqVlBnoe0VU8/rs:fit:1200:1200:1/g:ce/aHR0cHM6Ly93YWxs/cGFwZXJjYXZlLmNv/bS93cC93cDM0Mjk2/NzguanBn";
//  categoryModel.imageUrl= "https://images.unsplash.com/photo-1495563923587-bdc4282494d0?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80";
  category.add(categoryModel);

  //5
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Technology";
  categoryModel.imageUrl = "https://imgs.search.brave.com/RJo9tSzNpVYkUyAK-Azq-Q9sxhAKc2zBqVlBnoe0VU8/rs:fit:1200:1200:1/g:ce/aHR0cHM6Ly93YWxs/cGFwZXJjYXZlLmNv/bS93cC93cDM0Mjk2/NzguanBn";
//  categoryModel.imageUrl = "https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  category.add(categoryModel);

  return category;




}