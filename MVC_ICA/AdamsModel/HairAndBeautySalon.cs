namespace AdamsModel
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Salon.HairAndBeautySalon")]
    public partial class HairAndBeautySalon
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public HairAndBeautySalon()
        {
            Employees = new HashSet<Employee>();
        }

        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int SalonID { get; set; }

        [Required]
        public string Name { get; set; }

        [Required]
        public string Address { get; set; }

        [Required]
        public string Postcode { get; set; }

        [Column("Telephone Number")]
        [Required]
        public string Telephone_Number { get; set; }

        public string Website { get; set; }

        public string LogoURL { get; set; }

        public string Facebook { get; set; }

        public string Linkedin { get; set; }

        public string Twitter { get; set; }

        public string Googleplus { get; set; }

        public DbGeography Location { get; set; }

        public DateTime RegistrationDate { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Employee> Employees { get; set; }
    }
}
