using System;
using System.Linq.Expressions;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Linq;

namespace Prcecision.Master.Data.Core.Repositories
{
    public interface IRepository<T> where T : class
    {
        Task<List<T>> Get();

        IQueryable<T> GetQueryable();

        IQueryable<T> GetQueryable(Expression<Func<T, bool>> predicate);

        Task<List<T>> Get(Expression<Func<T, bool>> predicate);

        ValueTask<T> Get(int id);

        T GetById(int id);

        Task<T> GetSingleAsync(Expression<Func<T, bool>> predicate);

        Task<bool> IsExists(Expression<Func<T, bool>> predicate);

        void Add(T entity);

        void Add(List<T> entities);

        void Update(T entity);

        void Update(List<T> entities);

        void Delete(T entity);

        void Delete(List<T> entities);

        Task<int> Save();

        int SaveSync();

        void ChangeTracking();

    }
}
