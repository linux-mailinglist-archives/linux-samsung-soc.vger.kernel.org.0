Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 256F32AA839
	for <lists+linux-samsung-soc@lfdr.de>; Sat,  7 Nov 2020 23:19:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726021AbgKGWTI (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sat, 7 Nov 2020 17:19:08 -0500
Received: from asavdk3.altibox.net ([109.247.116.14]:46688 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725838AbgKGWTI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 7 Nov 2020 17:19:08 -0500
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id B7ECA2001E;
        Sat,  7 Nov 2020 23:19:05 +0100 (CET)
Date:   Sat, 7 Nov 2020 23:19:04 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Michael Tretter <m.tretter@pengutronix.de>
Cc:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        jy0922.shim@samsung.com, b.zolnierkie@samsung.com,
        narmstrong@baylibre.com, sw0312.kim@samsung.com, krzk@kernel.org,
        a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com,
        kernel@pengutronix.de, sylvester.nawrocki@gmail.com
Subject: Re: [PATCH v2 02/16] drm/exynos: remove in_bridge_node from
 exynos_dsi
Message-ID: <20201107221904.GB1052534@ravnborg.org>
References: <20200911135413.3654800-1-m.tretter@pengutronix.de>
 <20200911135413.3654800-3-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200911135413.3654800-3-m.tretter@pengutronix.de>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VbvZwmh9 c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=iP102twZQo61IpLVV8UA:9
        a=CjuIK1q_8ugA:10 a=48wsijYCjuUA:10 a=E9Po1WZjFZOl8hwRPBS3:22
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Sep 11, 2020 at 03:53:59PM +0200, Michael Tretter wrote:
> We do not need to keep a reference to the in_bridge_node, but we can
> simply drop it, once we found and attached the previous bridge.
> 
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

Note: I expect exynos people to pick it up.

	Sam
