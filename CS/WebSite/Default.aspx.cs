using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using DevExpress.XtraScheduler;
using DevExpress.Web.ASPxScheduler;
using DevExpress.Web.ASPxScheduler.Internal;
using System.Drawing;

public partial class _Default : System.Web.UI.Page {
    ASPxSchedulerStorage Storage { get { return ASPxScheduler1.Storage; } }

    protected void Page_Load(object sender, EventArgs e) {
        
        SetupMappings();
        ResourceFiller.FillResources(this.ASPxScheduler1.Storage, 3);

        ASPxScheduler1.AppointmentDataSource = this.appointmentDataSource;
        ASPxScheduler1.DataBind();

        ASPxScheduler1.GroupType = SchedulerGroupType.Resource;

        
        
        ASPxScheduler1.OptionsForms.AppointmentFormTemplateUrl = "~/CustomForms/AppointmentForm" + AssemblyInfo.VirtDirSuffix + ".de-DE.ascx";
        ASPxScheduler1.OptionsLoadingPanel.Text = "Laden...";
    }
    void SetupMappings() {
        ASPxAppointmentMappingInfo mappings = Storage.Appointments.Mappings;
        Storage.BeginUpdate();
        try {
            mappings.AppointmentId = "Id";
            mappings.Start = "StartTime";
            mappings.End = "EndTime";
            mappings.Subject = "Subject";
            mappings.AllDay = "AllDay";
            mappings.Description = "Description";
            mappings.Label = "Label";
            mappings.Location = "Location";
            mappings.RecurrenceInfo = "RecurrenceInfo";
            mappings.ReminderInfo = "ReminderInfo";
            mappings.ResourceId = "OwnerId";
            mappings.Status = "Status";
            mappings.Type = "EventType";
        }
        finally {
            Storage.EndUpdate();
        }
    }
    //Initializing ObjectDataSource
    protected void appointmentsDataSource_ObjectCreated(object sender, ObjectDataSourceEventArgs e) {
        e.ObjectInstance = new CustomEventDataSource(GetCustomEvents());
    }
    CustomEventList GetCustomEvents() {
        CustomEventList events = Session["ListBoundModeObjects"] as CustomEventList;
        if (events == null) {
            events = new CustomEventList();
            Session["ListBoundModeObjects"] = events;
        }
        return events;
    }

    // User-generated appointment id    
    protected void ASPxScheduler1_AppointmentInserting(object sender, PersistentObjectCancelEventArgs e) {
        SetAppointmentId(sender, e);
    }

    void SetAppointmentId(object sender, PersistentObjectCancelEventArgs e) {
        ASPxSchedulerStorage storage = (ASPxSchedulerStorage)sender;
        Appointment apt = (Appointment)e.Object;
        storage.SetAppointmentId(apt, apt.GetHashCode());
    }
}
