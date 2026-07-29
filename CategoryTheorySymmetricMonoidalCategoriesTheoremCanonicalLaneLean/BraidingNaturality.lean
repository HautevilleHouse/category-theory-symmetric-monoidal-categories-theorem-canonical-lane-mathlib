import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheorySymmetricMonoidalCategoriesTheoremCanonicalLaneLean.SymmetricMonoidalCategory

namespace HautevilleHouse
namespace CategoryTheorySymmetricMonoidalCategoriesTheoremCanonicalLaneLean

structure BraidingNaturalityPackage {C : SymmetricMonoidalCategory} where
  braidingNaturalInFirst : Prop
  braidingNaturalInSecond : Prop
  braidingInverse : Prop
  hexagonCondition : Prop

structure BraidingNaturalityEvidence {C : SymmetricMonoidalCategory}
    (B : BraidingNaturalityPackage) where
  braidingNaturalInFirstClosed : B.braidingNaturalInFirst
  braidingNaturalInSecondClosed : B.braidingNaturalInSecond
  braidingInverseClosed : B.braidingInverse
  hexagonConditionClosed : B.hexagonCondition

def BraidingNaturalityClosed {C : SymmetricMonoidalCategory}
    (B : BraidingNaturalityPackage) : Prop :=
  B.braidingNaturalInFirst ∧ B.braidingNaturalInSecond ∧
  B.braidingInverse ∧ B.hexagonCondition

theorem braiding_naturality_closed_from_evidence {C : SymmetricMonoidalCategory}
    (B : BraidingNaturalityPackage) (E : BraidingNaturalityEvidence B) :
    BraidingNaturalityClosed B := by
  exact And.intro E.braidingNaturalInFirstClosed
    (And.intro E.braidingNaturalInSecondClosed
      (And.intro E.braidingInverseClosed E.hexagonConditionClosed))

end CategoryTheorySymmetricMonoidalCategoriesTheoremCanonicalLaneLean
end HautevilleHouse