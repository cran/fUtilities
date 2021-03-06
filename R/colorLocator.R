
# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Library General Public
# License as published by the Free Software Foundation; either
# version 2 of the License, or (at your option) any later version.
#
# This library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU Library General Public License for more details.
#
# You should have received A copy of the GNU Library General
# Public License along with this library; if not, write to the
# Free Foundation, Inc., 59 Temple Place, Suite 330, Boston,
# MA  02111-1307  USA

# Copyrights (C)
# for this R-port:
#   1999 - 2008, Diethelm Wuertz, Rmetrics Foundation, GPL
#   Diethelm Wuertz <wuertz@itp.phys.ethz.ch>
#   www.rmetrics.org
# for the code accessed (or partly included) from other R-ports:
#   see R's copyright and license files
# for the code accessed (or partly included) from contributed R-ports
# and other sources
#   see Rmetrics's copyright file


################################################################################
# FUNCTION:                 COLOR NAMES:
#  colorLocator              Plots R's 657 named colors for selection
#  colorMatrix               Returns matrix of R's color names
################################################################################


################################################################################
# Package: epitools
# Version: 0.4-9
# Date: 2007-06-27
# Title: Epidemiology Tools
# Author: Tomas Aragon <aragon@berkeley.edu>
# Maintainer: Tomas Aragon <aragon@berkeley.edu>
# Depends: R (>= 2.1.0)
# Description: EpiTools: R Package for Epidemiologic Data and Graphics
# License: GPL version 2 or newer
# URL: http://www.epitools.net
# Packaged: Wed Jun 27 20:27:33 2007; Tomas


colorLocator <-
    function(locator = FALSE)
{
    # A copy from contributed R-package epitools

    # Description:
    #   Plots R's 657 named colors for selection

    # FUNCTION:

    # Settings:
    cex.axis = 0.7

    xx <- rep(1:30, 22)
    yy <- rep(1:22, rep(30, 22))
    yyy <- matrix(yy, ncol = 22)
    cm <- colorMatrix()
    matplot(xx[1:30], yyy, pch = 15, type = "n", axes = FALSE,
        xlab = "colorMatrix[row, ]", ylab = "colorMatrix[ , col]",
        main = "Identify Color Names.")
    # title(sub = "Source: www.epitools.net", cex.sub = 0.7)
    points(xx, yy, type = "p", pch = 15, cex = 2, col = c(colors(),
        NA, NA, NA))
    axis(1, at = c(0:30 + 0.5), labels = FALSE, tick = TRUE)
    axis(1, at = 1:30, label = 1:30, cex.axis = cex.axis, tick = FALSE)
    axis(2, at = c(0:22 + 0.5), labels = FALSE, tick = TRUE)
    axis(2, at = 1:22, label = 1:22, cex.axis = cex.axis, tick = FALSE,
        las = 1)

    if (locator == TRUE) {
        lxy <- locator()
        xy <- round(data.frame(lxy))
        xym <- as.matrix(xy)
        located <- data.frame(xy, color.names = cm[xym])
        return(located)
    } else {
        return(invisible(cm))
    }
}


# ------------------------------------------------------------------------------


colorMatrix <-
    function()
{
    # A copy from contributed R-package epitools

    # Description:
    #   Returns matrix of R's color names

    # FUNCTION:

    # Color Names:
    x <- matrix(c(colors(),NA,NA,NA), 30, 22)

    # return Value:
    invisible(x)
}


################################################################################

