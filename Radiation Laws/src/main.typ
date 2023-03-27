#import "template.typ": *

// Take a look at the file `template.typ` in the file panel
// to customize this template and discover how it works.
#show: project.with(
  title: "Radiation Laws",
  authors: (
    (name: "Abheek Dhawan", affiliation: "Coach"),
  ),
)

/*#show heading: it => block[
  #set align(center)
  //#set text(font: "Inria Serif")
  \~ #emph(it.body)
     #counter(heading).display() \~
]*/

// We generated the example code below so you can see how
// your document will look. Go ahead and replace it with
// your own content!

= Background

== Blackbodies
Blackbodies theoretical bodies that simply absorb and re-emit all incoming radiation without scattering or reflection. While they do not truly exist because of their ideal behavior, they serve as good models for many celestial objects. @kartunnen

== Luminosity
Luminosity is a vague term you may have heard before for something like "brightness", but let it be vague no longer. Luminosity is simply the power outputted by an object, generally a blackbody. It is often measured in watts or solar luminosities ($L_dot.circle$).

== Flux
Flux is simply the total radiation passing perpendicularly to a surface, as shown in @flux. This surface can be imaginary, such as a hollow sphere with the Sun at its center and the Earth at the edge. This is useful for understanding flux density. This is also useful for luminosity, which can be considered the flux through a surface enclosing the object.

#figure(
  image("flux.svg", width: 80%),
  caption: [
    A representation of the perpendicular component of radiation.
  ],
) <flux>

=== Flux Density
Flux density is the amount of radiation per unit area. The aforementioned Earth-Sun sphere can be used to get the flux density at a distance equal to the distance from the Sun to the Earth, and can then be used to get the incident flux from the Sun on Earth. This will be covered quantitatively later in this document.

#pagebreak()

= Blackbody Radiation Laws

== Planck's Law (Qualitative)
#figure(
  image("blackbody_curve.svg", width: 80%),
  caption: [
    The curves of blackbodies at different temperatures, colored by their peak wavelength.
  ]
) <blackbody_curve>

Provides relation regarding #link("https://en.wikipedia.org/wiki/Spectral_radiance")[spectral radiance]. Useful in terms of the derivation of other laws in blackbody radiation.

== Wien's Law
Wien's law creates a simple inverse relationship between the peak wavelength and temperature. It makes it very clear in terms of why hotter stars look bluer and cooler stars look redder.
$ T dot.op lambda_max = "const" $
Here, the constant is known as Wien's constant, with a value of about $2900 space mu m dot.op K$ and symbol $b$. The equation then becomes:
$ #rect(inset: 10pt)[$lambda_max = b / T$] $ <wiens_law> @royandclarke

=== Examples

==== Peak Wavelength of the Sun
The sun has a surface temperature of about $5800 space K$.

From @wiens_law:
$ lambda_max = b / T $

$ lambda_max = (2900 space mu m dot.op K) / (5800 space K) $

$ lambda_max approx 500 space n m $

@blackbody_curve shows that Sun peaks somewhere in the visible spectrum.

==== Peak Wavelength of a Human Body
The human body has a surface temperature of about $37 space degree C$, or $310 space K$.

From @wiens_law:
$ lambda_max = b / T $

$ lambda_max = (2900 space mu m dot.op K) / (310 space K) $

$ lambda_max approx 9.35 space mu m $

This wavelength is somewhere in the infrared, explaining why we don't see other humans glow unless looking through an infrared camera.

== Stefan-Boltzmann Law
The Stefan-Boltzmann law is quite important in terms of understanding the energy output of a star, and therefore how much energy is incident on other bodies. It can then be used (at least in Solar System) to calculate equilibrium temperature. It is based on the idea that the flux density $F$ at the surface of a blackbody is equal to
$ F = sigma T^4 $ <flux_density>
where $sigma$ is the Stefan-Boltzmann constant, $5.67 times 10^(-8) space W m^(-2) K^(-4)$ @kartunnen. It can be easily remembered as the numbers in the constant are in the order 5, 6, 7, 8. Since the flux density is given in @flux_density, it is simple to arrive at the luminosity by multiplying the flux density with the surface are of the blackbody:
$ L = 4 pi R^2 F $
$ #rect(inset: 10pt)[$L = 4 pi R^2 sigma T^4$] $ <stefans_law>

=== Examples

==== Equilibrium Temperature of the Earth
The sun has a surface temperature of about $5800 space K$, and a radius of about $6.96 times 10^8 space m$.

From @stefans_law:
$ L = 4 pi R^2 sigma T^4 $

$ L = 4 pi (6.96 times 10^8 space m)^2 sigma (5800 space K)^4 $

$ L approx 3.9 times 10^26 space W $

This is the net flux (luminosity) outputted by the Sun. To get the flux density at Earth, we simply need to create an imaginary sphere with the Sun at the center with the radius equal to the distance between the Earth and the Sun. Since the Sun's rays will be perpendicular to this imaginary sphere, we need not worry about cross products such as in @flux. The flux density will then become the total luminosity divided by the surface area of this imaginary sphere.

$ A = 4 pi r_plus.circle^2 $

$ A approx 2.81 times 10^23 space m^2 $

$ F = L/A = (3.9 times 10^26 space W) / (2.81 times 10^23 space m^2) approx 1389 W / m^2 $

Now that the flux density has been obtained, it can be use to find the incident flux on Earth. Instead of multiplying it by the surface area of the Earth, it must be multiplied by the cross-sectional area. If you're having trouble understanding why, take a look at @flux again to see how the incident angles can be simplified.

$ P_plus.circle = F times A_plus.circle = F times pi R_plus.circle^2 $

$ P_plus.circle approx 1.78 times 10^17 space W $

Notice that this is much, _much_ smaller than the power output of the Sun. It is finally time to go back to our wonderful Stefan-Boltzmann law to take this incident power/flux/luminosity and get the temperature of the Earth.

$ P_plus.circle = 4 pi R_plus.circle^2 sigma T_plus.circle^4 $

$ T_plus.circle = ((P_plus.circle)/(4 pi R_plus.circle^2 sigma))^(1/4) $

$ T_plus.circle approx 280 space K $
