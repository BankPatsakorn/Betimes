using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for FormControlTemplateManager
/// </summary>
public class FormControlTemplateManager
{
    List<FormControlTemplate> Controls = new List<FormControlTemplate>();
	public FormControlTemplateManager()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static FormControlTemplateManager GetTemplateFromPath(string dir)
    {
        FormControlTemplateManager obj = new FormControlTemplateManager();
        string[] files = Directory.GetFiles(dir,"*.html");
        foreach (var f in files)
        {
            obj.Controls.Add(FormControlTemplate.GetFormControlTemplate(f));
        }
        return obj;
    }

    public FormControlTemplate GetControlByName(string ctlName)
    {
        foreach (var ctl in Controls)
        {
            if (ctlName.ToLower() == ctl.ControlName)
            {
                return ctl;
            }
        }
        return null;
    }
}