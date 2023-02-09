using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace Prcecision.Master.Data.Core.EntityModel;

public partial class PrecisionContext : DbContext
{
 

    public PrecisionContext(DbContextOptions<PrecisionContext> options)
        : base(options)
    {
    }

    public virtual DbSet<LeaveRequest> LeaveRequests { get; set; }

    public virtual DbSet<User> Users { get; set; }

    public virtual DbSet<UserType> UserTypes { get; set; }

    public virtual DbSet<UsersTypeMapping> UsersTypeMappings { get; set; }


    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<LeaveRequest>(entity =>
        {
            entity.HasKey(e => e.LeaveRqstId).HasName("PK_LeaveRequest_1");

            entity.ToTable("LeaveRequest");

            entity.Property(e => e.ApprovedBy).HasMaxLength(50);
            entity.Property(e => e.ApprovedDate).HasColumnType("datetime");
            entity.Property(e => e.Comments).HasMaxLength(500);
            entity.Property(e => e.CreatedBy).HasMaxLength(50);
            entity.Property(e => e.CreatedDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.EndDate).HasColumnType("date");
            entity.Property(e => e.LeaveRqstGuid).HasDefaultValueSql("(newid())");
            entity.Property(e => e.ModifiedBy).HasMaxLength(50);
            entity.Property(e => e.ModifiedDate).HasColumnType("datetime");
            entity.Property(e => e.ReturnDate).HasColumnType("date");
            entity.Property(e => e.StartDate).HasColumnType("date");
            entity.Property(e => e.Status).HasMaxLength(50);
        });

        modelBuilder.Entity<User>(entity =>
        {
            entity.Property(e => e.Birthday).HasColumnType("date");
            entity.Property(e => e.CreatedBy).HasMaxLength(50);
            entity.Property(e => e.CreatedDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Email).HasMaxLength(50);
            entity.Property(e => e.FirstName).HasMaxLength(50);
            entity.Property(e => e.LastName).HasMaxLength(50);
            entity.Property(e => e.MiddleName).HasMaxLength(50);
            entity.Property(e => e.MobileNumber).HasMaxLength(50);
            entity.Property(e => e.ModifiedBy).HasMaxLength(50);
            entity.Property(e => e.ModifiedDate).HasColumnType("datetime");
            entity.Property(e => e.UserGuid).HasDefaultValueSql("(newid())");
            entity.Property(e => e.Username).HasMaxLength(50);
        });

        modelBuilder.Entity<UserType>(entity =>
        {
            entity.HasKey(e => e.UserTypeId).HasName("PK_UserType");

            entity.Property(e => e.CreatedBy).HasMaxLength(50);
            entity.Property(e => e.CreatedDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.ModifiedBy).HasMaxLength(50);
            entity.Property(e => e.ModifiedDate).HasColumnType("datetime");
            entity.Property(e => e.UserTypeDescription).HasMaxLength(100);
            entity.Property(e => e.UserTypeGuid).HasDefaultValueSql("(newid())");
            entity.Property(e => e.UserTypeName).HasMaxLength(50);
        });

        modelBuilder.Entity<UsersTypeMapping>(entity =>
        {
            entity.HasKey(e => e.UserTypeMappingId);

            entity.ToTable("UsersTypeMapping");

            entity.Property(e => e.CreatedBy).HasMaxLength(50);
            entity.Property(e => e.CreatedDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.ModifiedBy).HasMaxLength(50);
            entity.Property(e => e.ModifiedDate).HasColumnType("datetime");
            entity.Property(e => e.UserTypeMappingGuid).HasDefaultValueSql("(newid())");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
