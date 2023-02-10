using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Precision.ViewModel.RequestLeaveViewModel
{
    public class RequestLeaveViewModel
    {

        public int RequestorId { get; set; }

        public int ReportingToId { get; set; }

        public int? RequestedBy { get; set; }

        public DateTime? StartDateString { get; set; }


        public DateTime? EndDateString { get; set; }

        public DateTime? ReturnDateString { get; set; }

        public int NoOfDays { get; set; }

        public string? Comments { get; set; } = null!;

        public string? Status { get; set; }
    }
}
