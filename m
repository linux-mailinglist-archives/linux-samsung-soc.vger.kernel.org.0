Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AD0A43D259
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 27 Oct 2021 22:11:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240646AbhJ0UNc (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 27 Oct 2021 16:13:32 -0400
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27]:46097 "EHLO
        wnew2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243822AbhJ0UNG (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 27 Oct 2021 16:13:06 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.west.internal (Postfix) with ESMTP id 183132B0145E;
        Wed, 27 Oct 2021 16:10:36 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Wed, 27 Oct 2021 16:10:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-type:content-transfer-encoding; s=fm1; bh=
        Pzuy3GHzsQhH7Gexdc7CCv6QHaZ+swq3nhB47qtY9Js=; b=BhAiWrFvR3yPIX4c
        5inTQaZMkNWiKM2SWzdLrtVZuJclxR7mgc/3X/J2uTbt/yX3B4k+RAaTMy+VX1Xq
        HevDAekcpl6YVGXGjpRJ1Y2X8l3up/7ny9oXyhZnP9LYGhp9epMURm2EoYFjw6yA
        iyV1SPVtz6IyRgTtsHUb6aoPMm4fyaoTni+O2G83XB2QUgFe6Mb1rEYMSQLMr0XB
        u9lNk4I0z1p7LnOQH4OarnaYuaGBRLccQ8qQThPMcbv5nHL9cnTPR0nTW7iZ5twp
        o8133D0BZ6V2iIFdw2EnliIvFhWA4FjwOi5L1tsJuTXNuIlFIJ2r8FUkeVh7xYQ4
        rMimUQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=Pzuy3GHzsQhH7Gexdc7CCv6QHaZ+swq3nhB47qtY9
        Js=; b=XTcFyk54qvxFmEB+WhYQ60H0S4DCT7r4/35IszIZmzhnI4ZhCvFjxNNXw
        GxDg/hr1SIJAIs/0Q4biKV6B7bCVqy3dvYijfQDIJ/Zd0yhQEA75gZs7ZwMMqfJi
        Bl9ed9G0G/XZB7GX4f9ExS1+66s/6n1MN24Y8Sz58ZSOBJ8TBJm2YYohlUvtMEUa
        66URTMss1QDkJy5/wnPOuoC6tX5fiiwnrSIyPREQBVjtbks4LtNMhTT+CIYKqphS
        2hAfo98EHzz9/GSM2mGlB3XgcRbzqyV9LYFvcyqn/yI+y8b0JuI3peC9wbmNa02L
        v3VsbgW0J0lIG/lvLWlPc8rt5GC3g==
X-ME-Sender: <xms:O7J5YXUt9GRQmbkkzOB81_5j_700W4kWibRE0cRmdwQ31_yNGLxP0w>
    <xme:O7J5YfmUoAJXVYFrrNL2SLsVYE9TdPVWlx-TnQ6Aq9rSN_Z-xpNIvGT1omlz7qofI
    AUvE6u1Ep3jyAUXaLw>
X-ME-Received: <xmr:O7J5YTZ8I5-3jHtOL5_y2QcyDHyO1figEGc-kNxMpE-NJ_EDuC6u3SyfPCsnupY4qgb_xptRmWETyTWZDdRHIPuRu64cbtrsJlk5ZmMX>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdegtddgheefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeejuefggeekfffgueevtddvudffhfejffejjedvvdduudethefhfefhfeeg
    ieekkeenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:O7J5YSXTXz4Va-ZGBfeMH1b2_3rtwUDj3G6GjocH_Kv3m0Jw29J3bQ>
    <xmx:O7J5YRnp354zopF1FgbtZs1lgL2izGKXiOev9cTYTN4PaABBi--WGg>
    <xmx:O7J5YfdRteKOmbtWXRr3ll8k1HQlFgSfM3mC35QCfNX8YG327ipqtA>
    <xmx:O7J5YT3GMgIXeKv_7uWSYUka1bkadOx5FJAjuzvp8dSRXbeMv_Hczs9eqeY>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 27 Oct 2021 16:10:34 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Robert Foss <robert.foss@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Maxime Ripard <maxime@cerno.tech>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Cc:     Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        linux-kernel@vger.kernel.org, Tian Tao <tiantao6@hisilicon.com>,
        Rob Clark <robdclark@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sean Paul <sean@poorly.run>,
        Chen Feng <puck.chen@hisilicon.com>,
        Inki Dae <inki.dae@samsung.com>,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Xinliang Liu <xinliang.liu@linaro.org>
Subject: Re: (subset) [PATCH v6 07/21] drm/bridge: lt9611: Switch to devm MIPI-DSI helpers
Date:   Wed, 27 Oct 2021 22:09:38 +0200
Message-Id: <163532324663.18245.7163183883290156619.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211025151536.1048186-8-maxime@cerno.tech>
References: <20211025151536.1048186-1-maxime@cerno.tech> <20211025151536.1048186-8-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 25 Oct 2021 17:15:22 +0200, Maxime Ripard wrote:
> Let's switch to the new devm MIPI-DSI function to register and attach
> our secondary device.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
