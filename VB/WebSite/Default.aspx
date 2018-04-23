<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.ASPxScheduler.v8.1, Version=8.1.1.0, Culture=neutral, PublicKeyToken=9B171C9FD64DA1D1"
	Namespace="DevExpress.Web.ASPxScheduler" TagPrefix="dxwschs" %>
<%@ Register Assembly="DevExpress.XtraScheduler.v8.1.Core, Version=8.1.1.0, Culture=neutral, PublicKeyToken=9B171C9FD64DA1D1"
	Namespace="DevExpress.XtraScheduler" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
	<title>Untitled Page</title>
</head>
<body>
	<form id="form1" runat="server">
				<asp:ObjectDataSource ID="appointmentDataSource" runat="server" DataObjectTypeName="CustomEvent"
			 TypeName="CustomEventDataSource" DeleteMethod="DeleteMethodHandler" SelectMethod="SelectMethodHandler" InsertMethod="InsertMethodHandler" UpdateMethod="UpdateMethodHandler" OnObjectCreated="appointmentsDataSource_ObjectCreated"></asp:ObjectDataSource>


	<div>
		<%-- OnAppointmentFormShowing="ASPxScheduler1_AppointmentFormShowing" OnBeforeExecuteCallbackCommand="ASPxScheduler1_BeforeExecuteCallbackCommand" --%>

		<dxwschs:ASPxScheduler ID="ASPxScheduler1" runat="server" 
		   Width="400px" Start="2008-03-13" ClientInstanceName="clientscheduler" OnAppointmentInserting="ASPxScheduler1_AppointmentInserting">
			<Storage>
				<Appointments ResourceSharing="True" >
				</Appointments>

			</Storage>
			<Views>
				<WorkWeekView>
					<TimeRulers>
						<cc1:TimeRuler>
						</cc1:TimeRuler>
					</TimeRulers>
				</WorkWeekView>
				<DayView>
					<TimeRulers>
						<cc1:TimeRuler>
						</cc1:TimeRuler>
					</TimeRulers>
					<DayViewStyles ScrollAreaHeight="400px">
					</DayViewStyles>
				</DayView>
			</Views>
		</dxwschs:ASPxScheduler>

	</div>


	</form>
</body>
</html>
