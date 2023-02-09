

namespace Prcecision.Master.Data.Core.Repositories
{
    using Microsoft.EntityFrameworkCore;
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Linq.Expressions;
    using System.Threading.Tasks;


    public class Repository<T> : IDisposable, IRepository<T> where T : class
    {
        protected DbContext Context { get; }
        protected DbSet<T> Dbset { get; }

        protected Repository(DbContext dataDbContext)
        {
            Context = dataDbContext;
            Dbset = Context.Set<T>();
        }

        public Task<List<T>> Get()
        {
            return Dbset.ToListAsync<T>();
        }

        public IQueryable<T> GetQueryable()
        {
            return Dbset;
        }

        public IQueryable<T> GetQueryable(Expression<Func<T, bool>> predicate)
        {
            return Dbset.Where(predicate);
        }

        public Task<List<T>> Get(Expression<Func<T, bool>> predicate)
        {
            return Dbset.Where(predicate).ToListAsync<T>();
        }

        public ValueTask<T> Get(int id)
        {
            return Dbset.FindAsync(id);

        }

        public T GetById(int id)
        {
            return Dbset.Find(id);
        }

        public  Task<T> GetSingleAsync(Expression<Func<T, bool>> predicate)
        {
            return  Dbset.FirstOrDefaultAsync(predicate);
        }

        public Task<bool> IsExists(Expression<Func<T, bool>> predicate)
        {
            return Dbset.AnyAsync(predicate);
        }

        public void Add(T entity)
        {
            Dbset.Attach(entity);
            Dbset.AddAsync(entity);
        }

        public T AddEntity(T entity)
        {
            Dbset.Attach(entity);
            Dbset.AddAsync(entity);
            SaveSync();
            Dispose();
            return entity;
        }

        public void Add(List<T> entities)
        {
            Dbset.AttachRange(entities);
            Dbset.AddRangeAsync(entities);
        }

        public void Update(T entity)
        {
            Dbset.Attach(entity);
            Context.Entry(entity).State = EntityState.Modified;
        }

        public void Update(List<T> entities)
        {
            Dbset.AttachRange(entities);
            Dbset.UpdateRange(entities);
        }

        public void Delete(T entity)
        {
            Dbset.Attach(entity);
            Dbset.Remove(entity);
        }

        public void Delete(List<T> entities)
        {
            Dbset.RemoveRange(entities);
        }

        public async Task<int> Save()
        {
            return await this.Context.SaveChangesAsync();
        }

        public int SaveSync()
        {
            return Context.SaveChanges();
        }

        public void Dispose()
        {
            Context?.Dispose();
        }

        public void ChangeTracking()
        {
            this.Context.ChangeTracker.Clear();
        }
    }
}
