namespace ModelEF.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Product")]
    public partial class Product
    {
        [Key]
        [StringLength(5)]
        public string IDproduct { get; set; }

        [StringLength(100)]
        public string Nameproduct { get; set; }

        [StringLength(10)]
        public string Size { get; set; }

        [Required]
        [StringLength(5)]
        public string category { get; set; }

        public string Image { get; set; }

        [StringLength(200)]
        public string Description_pd { get; set; }

        public int? Quantity { get; set; }

        public decimal? UnitCost { get; set; }

        public virtual Category Category1 { get; set; }
    }
}
