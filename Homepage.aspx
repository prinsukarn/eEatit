<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="EatiT.com.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link href="Bootstrap/css/bootstrap.min.css" rel="stylesheet" />
        <link href="Fontawesome/css/all.css" rel="stylesheet" />
        <link href="Datatable/css/jquery.dataTables.min.css" rel="stylesheet" />
        <link href="StyleSheet1.css" rel="stylesheet" />
    
    
        <script src="Bootstrap/js/bootstrap.min.js"></script>
        <script src="Bootstrap/js/jquery-3.5.1.slim.min.js"></script>
        <script src="Bootstrap/js/popper.min.js"></script>
        <script src="Datatable/js/jquery.dataTables.min.js"></script>
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     
 <!--------    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Timer ID="Timer1" runat="server" Interval="2000" >
            </asp:Timer>
            <asp:Image ID="Image3" ImageUrl="Carouselimg/food10.jpg" runat="server" class="img-fluid" />
        </ContentTemplate>
    </asp:UpdatePanel> --------------->
    <div id="carouselExampleControl" class="carousel slide" data-interval="2000" data-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-100"  src="Carouselimg/snack-2635035_1280.jpg"   style="height:475px;" alt="First slide">
        <div class="carousel-caption d-none d-md-block">
    <h5>Food </h5>
    <p>From Your Favourite restaurants</p>
  </div>
    </div>
      
       <div class="carousel-item">
         
      <img class="d-block w-100" style="height:475px;" src="Carouselimg/deep-raj-khadka-29mmzt0qLVM-unsplash.jpg"    alt="Third slide">
        <div class="carousel-caption d-none d-md-block">   <h5>Delicious Momo</h5>
  </div>
    </div>
    
      
       <div class="carousel-item">
      <img class="d-block w-100" style="height:450px;" src="Carouselimg/neonbrand-9m2RZvHS_cU-unsplash.jpg"  alt="Third slide">
              <div class="carousel-caption d-none d-md-block">
    <h5>Grocery </h5>
  </div>
    </div>
   <div class="carousel-item">
      <img class="d-block w-100" style="height:475px;"  src="Carouselimg/apple.jpg"   alt="Third slide">
             <div class="carousel-caption d-none d-md-block">
    <h5>Fresh Fruits</h5>
  </div>
    </div>
     <div class="carousel-item">
      <img class="d-block w-100" style="height:475px;"  src="image/basil.jpg"  alt="Third slide">
   
    </div>
      <div class="carousel-item">
      <img class="d-block w-100" style="height:475px;"  src="image/supermarket-5202138_960_720.jpg"  alt="Third slide">
    </div>
      <div class="carousel-item">
      <img class="d-block w-100" style="height:475px;"   src="image/FOOD01.jpg"   alt="Third slide">
    </div>
    
     <div class="carousel-item">
      <img class="d-block w-100" style="height:475px;"  src="image/pexels-photo-4533909.jpeg"  alt="Third slide">
    </div>
      <div class="carousel-item">
      <img class="d-block w-100" style="height:475px;"  src="Carouselimg/cake.jpeg"  alt="Third slide">
    </div>
     
     <div class="carousel-item">
      <img class="d-block w-100" style="height:475px;"  src="imgs/panipuri-74974_960_720.jpg"   alt="Third slide">
   
    </div>
      <div class="carousel-item">
      <img class="d-block w-100" style="height:475px;"  src="imgs/grill-4709068_960_720.jpg"   alt="Third slide">
    </div>
<div class="carousel-item">
      <img class="d-block w-100" style="height:475px;"  src="Carouselimg/cupcake.jpg"  alt="Third slide">
    </div>
<div class="carousel-item">
      <img class="d-block w-100" style="height:475px;"  src="Carouselimg/handpizza.jpeg" alt="Third slide">
    </div>
     
      <div class="carousel-item">
      <img class="d-block w-100" style="height:475px;"  src="Carouselimg/samosa.jpg"  alt="Third slide">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
                    <div class="container-fluid mx-auto" style="background-color:white;">
    
                    <div class="card mx-auto" style="border:0px;">
               <div class="card-body" >
                  <div class="row">
                     <div class="col ml-4">                       
                         <h4>Top Restaurants</h4>                       
                     </div>
                      <div class="col-8 text-right mr-lg-5" style="color:black;text-decoration:none;">
                         <asp:LinkButton ID="LinkButton3" runat="server"  OnClick="LinkButton3_Click">See More>></asp:LinkButton>
                        </div>                  
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                      </div>
           <div class="row">            
               <div class="col-12 mx-auto">
                     <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:EaTiT-dbConnectionString %>" SelectCommand="SELECT * FROM [Top_Vendor_Table]"></asp:SqlDataSource>
                       <div class="col-12 mx-auto mr-1">
                         <asp:DataList ID="DataList2" runat="server" cssClass="row" RepeatLayout="Flow" RepeatDirection="Horizontal" DataSourceID="SqlDataSource2" OnItemCommand="DataList2_ItemCommand">
                             <ItemTemplate>
                                  <div class="container-fluid">
                                 <div class="col-12  mx-auto">
                                 <asp:Image ID="Image4" runat="server" Height="150px" ImageUrl='<%# Eval("Vendor_ImageLink") %>' Width="250px" />
                                 <br />
                                
                                 <br />
      <asp:Button ID="Button1" runat="server" CssClass="btn-block" CommandArgument='<%# Eval("Vendor_Name") %>'  style="border:0px;background-color:white;" CommandName="View Menu" Text='<%# Eval("Vendor_Name") %>'/>
                     
                                     </div></div>
                             </ItemTemplate>                            
                         </asp:DataList>                       
                         </div>
                   </div>
               </div>
            </div>
            </div>
  </div>
    

        <div class="container-fluid mx-auto" style="background-color:white;">
    
                    <div class="card mx-auto" style="border:0px;">
               <div class="card-body" >
                  <div class="row">
                     <div class="col ml-4">
                        
                           <h4>Special Items</h4>
                        
                     </div>
                      <div class="col-8 text-right mr-lg-5" style="color:black;text-decoration:none;">
                         <asp:LinkButton ID="LinkButton4" runat="server"  OnClick="LinkButton4_Click">See More>></asp:LinkButton>
                        </div>
                  
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                      </div>
           <div class="row">
               <div class="col-12 mx-auto">
                     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EaTiT-dbConnectionString %>" SelectCommand="SELECT * FROM [Specialitem_Master_table]"></asp:SqlDataSource>
                         <div class="col-12 mx-auto mr-1">
                         <asp:DataList ID="DataList1" runat="server" cssClass="row" RepeatLayout="Flow" RepeatDirection="Horizontal" DataSourceID="SqlDataSource1" OnItemCommand="DataList1_ItemCommand">
                             <ItemTemplate>
                                 <div class="container-fluid">
                                 <div class="col-12  mx-auto">
                                 <asp:Image ID="Image2" runat="server"  class="img-fluid mx-auto" Width="250px" Height="150 px" ImageUrl='<%# Eval("Sitem_imagelink") %>' />
                                 <br />
                                     <asp:Button ID="Button1" runat="server" CssClass="btn-block" CommandArgument='<%# Eval("SItem_Name") %>'  style="border:0px;background-color:white;" CommandName="View Menu" Text='<%# Eval("SItem_Name") %>'/>
                     
         </div>
                                     </div>
                             </ItemTemplate>  
                         </asp:DataList>                       
                         </div>
               </div>
            </div>
            </div>
  </div>
</div>
               </div>
           </div>
        
    
 <div class="container-fluid p-2"style="background-color:white;" >
     <div class="container" style="background-color:white;">
         <div class="row">
           <div class="col-12 text-center pt-md-2">
                <h3>Food Delivered To Your Doorstep</h3>
           </div>
         </div>
    <div class="row  mx-auto">
    <div class="col-md-3  col-sm-6 text-justify">
         <div class="card m-md-2" style="width: 12rem;background-color:white;border:0px;">
           <img src="imgs/limit.svg" class="card-img-top rounded mx-auto d-block" style="width:50%;" alt="...">
             <div class="card-body p-0">
              <h5 class="card-title text-center">No order limit</h5>
              <p class="card-text text-center ">Order for your loved ones without limit</p>
              </div>
          </div>
</div>
        <div class="col-md-3  col-sm-6 text-justify">
         <div class="card m-md-2" style="width: 12rem;background-color:white;border:0px;">
           <img src="imgs/delivery.png" class="card-img-top rounded mx-auto d-block" style="width:50%;" alt="...">
             <div class="card-body p-0">
              <h5 class="card-title text-center">Fast Delivery</h5>
              <p class="card-text text-center ">Enjoy the smell of hot and fresh delicacies</p>
              </div>
          </div>
</div>
        <div class="col-md-3  col-sm-6 text-justify">
         <div class="card m-md-2" style="width: 12rem;background-color:white;border:0px;">
           <img src="imgs/1554401.svg" class="card-img-top rounded mx-auto d-block" style="width:50%;" alt="...">
             <div class="card-body p-0">
              <h5 class="card-title text-center">Cash On Delivery</h5>
              <p class="card-text text-center ">Pay us only when you get item of your choice in your hand</p>
              </div>
          </div>
</div>
        <div class="col-md-3  col-sm-6 text-justify">
         <div class="card m-md-4 m-lg-2" style="width: 12rem;background-color:white;border:0px;">
           <img src="imgs/offer.png" class="card-img-top rounded mx-auto d-block" style="width:50%;" alt="...">
             <div class="card-body p-0">
              <h5 class="card-title text-center">Occasional Offers</h5>
              <p class="card-text text-center ">Get ready for suprises from us which will make your family time more valuable</p>
              </div>
          </div>
</div>
 </div>
         </div>
     </div>
  
  
    <div class="container-fluid" style="background-color:#ecf0f1;">
        <div class="col-md-10 mx-auto p-md-2">
        <h3 class="text-center">Join Hands with us</h3>
        <p class="text-center mx-4" style="font-weight:200;font-size:20px;"><strong>Want to reach new customers!</strong><br>If so, list your restaurant to our list<br><asp:LinkButton ID="LinkButton2" runat="server" type="button" class="btn btn-success" OnClick="LinkButton2_Click">Send A Request</asp:LinkButton>
        </p>
    </div>
    </div>
 
</asp:Content>
