import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheorySymmetricMonoidalCategoriesTheoremCanonicalLaneLean

structure AdjointFunctorPackage where
  categories : Type u → Type v
  functor : Type u → Type u → Type u
  leftAdjointExists : Prop
  rightAdjointExists : Prop
  unitCounitNatural : Prop
  triangleIdentities : Prop

structure AdjointFunctorEvidence (A : AdjointFunctorPackage) where
  leftAdjointExistsClosed : A.leftAdjointExists
  rightAdjointExistsClosed : A.rightAdjointExists
  unitCounitNaturalClosed : A.unitCounitNatural
  triangleIdentitiesClosed : A.triangleIdentities

def AdjointFunctorClosed (A : AdjointFunctorPackage) : Prop :=
  A.leftAdjointExists ∧ A.rightAdjointExists ∧ A.unitCounitNatural ∧ A.triangleIdentities

theorem adjoint_functor_closed_from_evidence (A : AdjointFunctorPackage)
    (E : AdjointFunctorEvidence A) : AdjointFunctorClosed A := by
  exact And.intro E.leftAdjointExistsClosed
    (And.intro E.rightAdjointExistsClosed
      (And.intro E.unitCounitNaturalClosed E.triangleIdentitiesClosed))

end CategoryTheorySymmetricMonoidalCategoriesTheoremCanonicalLaneLean
end HautevilleHouse
