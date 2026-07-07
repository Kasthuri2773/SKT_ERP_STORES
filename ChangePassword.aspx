<%@ Page Language="C#" MasterPageFile="~/MainPage.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="ChangePassword" Title="" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<script type="text/javascript">
    function SaveMsgAlert(msg) {
        alert(msg);
    }
</script>

<div class="page-breadcrumb">
    <ol class="breadcrumb container">
        <h4><li class="active">Change Password</li></h4> 
    </ol>
</div>
<div id="main-wrapper" class="container">
<div class="row">
    <div class="col-md-12">
        <div class="col-md-9">
			<div class="panel panel-white">
			<div class="panel panel-primary">
				<div class="panel-heading clearfix">
					<h4 class="panel-title">Change Password</h4>
				</div>
			</div>
				<form class="form-horizontal">
				<div class="panel-body">
					<div class="col-md-12">
					    <div class="row">
					       
					        <%--<asp:LinkButton ID="btnSearch" class="btn btn-primary btn-addon  btn-rounded btn-sm" runat="server" OnClick="btnSearch_Click"><i class="fa fa-search"></i>Search</asp:LinkButton>--%>
					        <div class="form-group col-md-4">
					            <label for="exampleInputName">New Password<span class="mandatory">*</span></label>
					            <asp:TextBox ID="txtNewPassword" class="form-control" runat="server" TextMode="Password"></asp:TextBox>
					            <asp:RequiredFieldValidator ControlToValidate="txtNewPassword" ValidationGroup="Validate_Field" class="form_error" ID="RequiredFieldValidator1" runat="server" EnableClientScript="true" ErrorMessage="This field is required.">
                                </asp:RequiredFieldValidator>
					        </div>
					        <div class="form-group col-md-4">
					            <label for="exampleInputName">Conform Password<span class="mandatory">*</span></label>
					            <asp:TextBox ID="txtConformPassword" class="form-control" runat="server" TextMode="Password"></asp:TextBox>
					            <asp:RequiredFieldValidator ControlToValidate="txtConformPassword" ValidationGroup="Validate_Field" class="form_error" ID="RequiredFieldValidator4" runat="server" EnableClientScript="true" ErrorMessage="This field is required.">
                                </asp:RequiredFieldValidator>
					        </div>     
					    </div>
					</div>
					
					<!-- Button start -->
					<div class="col-md-12">
					    <div class="row">
					        <div class="txtcenter">
                                <div class="col-sm-11">
                                    <asp:Button ID="btnSave" class="btn btn-success"  runat="server" Text="Save" 
                                        ValidationGroup="Validate_Field" onclick="btnSave_Click" />
                                    <%--<asp:Button ID="Button1" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-lg" runat="server" Text="View" />--%>
                                    <asp:Button ID="btnCancel" class="btn btn-danger" runat="server" Text="Cancel" 
                                        onclick="btnCancel_Click" />
                                </div>
                            </div>
					    </div>
					</div>                            
                    <!-- Button End -->
                    
                   
					
				    </div><!-- panel body end -->
				</form>
			</div><!-- panel white end -->
		</div><!-- col-9 end -->
		    <div class="col-md-2"></div>
		    <div class="col-md-2"></div>
	    <div class="col-md-2"></div>
		<!-- Dashboard start -->
		<div class="col-lg-3 col-md-6">
            <div class="panel panel-white" style="height: 100%;">
                <div class="panel-heading">
                    <h4 class="panel-title">Dashboard Details</h4>
                    <div class="panel-control">
                    </div>
                </div>
                <div class="panel-body">
                </div>
            </div>
        </div>  
                        
        <div class="col-lg-3 col-md-6">
            <div class="panel panel-white">
                <div class="panel-body">
                    <div class="live-tile flip ha" data-mode="flip" data-speed="750" data-delay="3000">
                       
                    </div>
                </div>
            </div>
            
        </div> 
		<!-- Dashboard End -->
		<div class="col-md-2"></div>
		<div class="col-md-2"></div>
		<div class="col-md-2"></div>
		<div class="col-md-2"></div>
		<div class="col-md-2"></div>
		<div class="col-md-2"></div>
      </div><!-- col 12 end -->
  </div><!-- row end -->
 </div><!-- main-wrapper end -->


</asp:Content>

