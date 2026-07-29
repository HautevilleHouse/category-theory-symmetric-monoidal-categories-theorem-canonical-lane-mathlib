import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheorySymmetricMonoidalCategoriesTheoremCanonicalLaneLean

structure SymmetricMonoidalCategoryPackage where
  categoryObject : Type u
  tensorProduct : Type v
  associator : Prop
  leftUnitor : Prop
  rightUnitor : Prop
  braiding : Prop
  symmetryCondition : Prop
  coherencePentagon : Prop
  coherenceTriangle : Prop
  coherenceHexagon : Prop

structure SymmetricMonoidalCategoryEvidence (P : SymmetricMonoidalCategoryPackage) where
  associatorClosed : P.associator
  leftUnitorClosed : P.leftUnitor
  rightUnitorClosed : P.rightUnitor
  braidingClosed : P.braiding
  symmetryConditionClosed : P.symmetryCondition
  coherencePentagonClosed : P.coherencePentagon
  coherenceTriangleClosed : P.coherenceTriangle
  coherenceHexagonClosed : P.coherenceHexagon

def SymmetricMonoidalCategoryClosed (P : SymmetricMonoidalCategoryPackage) : Prop :=
  P.associator ∧ P.leftUnitor ∧ P.rightUnitor ∧ P.braiding ∧
  P.symmetryCondition ∧ P.coherencePentagon ∧ P.coherenceTriangle ∧ P.coherenceHexagon

theorem symmetric_monoidal_category_closed_from_evidence
  (P : SymmetricMonoidalCategoryPackage) (E : SymmetricMonoidalCategoryEvidence P) :
  SymmetricMonoidalCategoryClosed P := by
  exact And.intro E.associatorClosed
    (And.intro E.leftUnitorClosed
      (And.intro E.rightUnitorClosed
        (And.intro E.braidingClosed
          (And.intro E.symmetryConditionClosed
            (And.intro E.coherencePentagonClosed
              (And.intro E.coherenceTriangleClosed E.coherenceHexagonClosed))))))

end CategoryTheorySymmetricMonoidalCategoriesTheoremCanonicalLaneLean
end HautevilleHouse