import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheorySymmetricMonoidalCategoriesTheoremCanonicalLaneLean

structure MonoidalCategoryPackage where
  objects : Type u
  morphisms : objects → objects → Type v
  tensorProduct : objects → objects → objects
  unitObject : objects
  associator : (A B C : objects) → morphisms (tensorProduct (tensorProduct A B) C) (tensorProduct A (tensorProduct B C))
  leftUnitor : (A : objects) → morphisms (tensorProduct unitObject A) A
  rightUnitor : (A : objects) → morphisms (tensorProduct A unitObject) A
  pentagonCondition : Prop
  triangleCondition : Prop
  pentagonConditionClosed : pentagonCondition
  triangleConditionClosed : triangleCondition

structure MonoidalCategoryEvidence (M : MonoidalCategoryPackage) where
  pentagonConditionClosed : M.pentagonCondition
  triangleConditionClosed : M.triangleCondition

def MonoidalCategoryClosed (M : MonoidalCategoryPackage) : Prop :=
  M.pentagonCondition ∧ M.triangleCondition

theorem monoidal_category_closed_from_evidence (M : MonoidalCategoryPackage) (E : MonoidalCategoryEvidence M) : MonoidalCategoryClosed M := by
  exact And.intro E.pentagonConditionClosed E.triangleConditionClosed

end CategoryTheorySymmetricMonoidalCategoriesTheoremCanonicalLaneLean
end HautevilleHouse