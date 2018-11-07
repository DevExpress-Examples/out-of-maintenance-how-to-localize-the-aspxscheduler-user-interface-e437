<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.ASPxScheduler.v15.2, Version=15.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxScheduler" TagPrefix="dxwschs" %>
<%@ Register Assembly="DevExpress.XtraScheduler.v15.2.Core, Version=15.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
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
           Width="400px" Start="2008-03-13" ClientInstanceName="clientscheduler">
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
            <OptionsForms 
                AppointmentFormTemplateUrl="~/CustomForms/AppointmentForm_v10_2.it.ascx"
                AppointmentInplaceEditorFormTemplateUrl="~/CustomForms/InplaceEditor_v10_2.it.ascx"
                GotoDateFormTemplateUrl="~/CustomForms/GotoDateForm_v10_2.it.ascx"
                RecurrentAppointmentDeleteFormTemplateUrl="~/CustomForms/RecurrentAppointmentDeleteForm_v10_2.it.ascx"
                RecurrentAppointmentEditFormTemplateUrl="~/CustomForms/RecurrentAppointmentEditForm_v10_2.it.ascx"
                RemindersFormTemplateUrl="~/CustomForms/ReminderForm_v10_2.it.ascx" />
            <OptionsToolTips
                AppointmentDragToolTipUrl="~/CustomForms/AppointmentDragToolTip_v10_2.it.ascx" />
        </dxwschs:ASPxScheduler>
    
    </div>
    
 
    </form>
</body>
</html>
