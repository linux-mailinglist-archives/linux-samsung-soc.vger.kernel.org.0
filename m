Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFF8743D21E
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 27 Oct 2021 22:10:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240468AbhJ0UM3 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 27 Oct 2021 16:12:29 -0400
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27]:58109 "EHLO
        wnew2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238558AbhJ0UM2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 27 Oct 2021 16:12:28 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.west.internal (Postfix) with ESMTP id A99D62B01443;
        Wed, 27 Oct 2021 16:10:00 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Wed, 27 Oct 2021 16:10:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-type:content-transfer-encoding; s=fm1; bh=
        174Tv2ikzgiRBSTtownAlIa8Hc51jyjcuiG0KQ+hbd4=; b=klhpQktTVF61lxXN
        z6RCvTo2tny/dJjRuxboJyG1CMUDkRlJEpybOBXpRKDEODVD4d9xuW1WYDpYdx+C
        KulO2TB5DowEHlq8mZyvDiTPBqGYri8i3hOikVl1Dib0hjseyPj2m3Jt7bhpv1bW
        CWBUOATejnIDgEb1BPneBdBQvHKxNzrQiB9yMhfeXmh614FK6O8NTbYvmv58qVWo
        kLHHu2KwNA0kV70AXZQz/s8Wfk/6u1v2trJzo98j9ldksC3Cd3tfTYuG99vf2iSy
        PrfZAJvoFLz8S5HIw5k2pKVN+ELyy9aVSKOtCZXKh7vKXVKhw8rcGRZgPatdVVxn
        k8u44A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=174Tv2ikzgiRBSTtownAlIa8Hc51jyjcuiG0KQ+hb
        d4=; b=axByOoFcgh/+Az9kxCAWrpeZ+pr1oBtjvspPcqjQDmggOrhT6eQp5dOyQ
        f+dBmGLg57skwzqsyfsNvnC/IkfJ40ghAzlNUXnxt9O/vOAYx91mb3sA4e5kyp1G
        9iRhLuNtAfD9cIKOT0z2snPjGjH+vMdZyvg9UAXfBAVLl2o/kB1jbxxblWbMc43I
        8piqXiFWnD/ytNrYWExKS4Q47PiaG+MAcUTJVMIcq2D2esDjbdemR6Y1q2yt58qb
        DGaTP5EEN+f4UcWsYvq3tQsPSH9q2VENRNQHyBqhk2QTV+Hj1ACJgfMETs7ssbVK
        2uap3uKjqzPMG5qGJ4XSjKfvhMCUg==
X-ME-Sender: <xms:E7J5YdAY0n9flJiRx5R0OECAz0MRM-T0-3OXKy0Besh0Rcrt8zH7Ow>
    <xme:E7J5YbiMdbYr7gJWxYbszTBZxteZRqJaBXd0iTVipXlI-OLPv_XMOk7uW-pqhnxJw
    ef3aMxyYLCY5hapZf4>
X-ME-Received: <xmr:E7J5YYmSeo1YK4dfYwkF0CatVXGEjyK5u8Ec-hv0lu_pERSVwncofednqCWir9U0focRTQ0fGoHuY_EplfHuh7oHEXYVykjrXiUGe5qO>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdegtddguddutdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepjeeugfegkeffgfeuvedtvddufffhjeffjeejvddvudduteehhfefhfef
    geeikeeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:E7J5YXzmBoYwJDS2qv2M1HB3Uma-QDNHhBuH_lLh6v9Be4Bch1ji6g>
    <xmx:E7J5YSRPl4I1q8F6RqB0KEMDScNFcGyKk2pIpURIof-etyvcqXKfcQ>
    <xmx:E7J5YaamnTlyH3tkt3g4lPSW_1pfw3CaS4xPO9rlVqR_kLDTbNL5dg>
    <xmx:GLJ5YWwe5m9gr5x4nWinl-9JeTHzLO56Nqf2In0qEr3XLcz6bnvpKQCWZ8Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 27 Oct 2021 16:09:55 -0400 (EDT)
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
        Tian Tao <tiantao6@hisilicon.com>,
        linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Sean Paul <sean@poorly.run>, Inki Dae <inki.dae@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Chen Feng <puck.chen@hisilicon.com>,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Xinliang Liu <xinliang.liu@linaro.org>
Subject: Re: (subset) [PATCH v6 01/21] drm/bridge: adv7533: Switch to devm MIPI-DSI helpers
Date:   Wed, 27 Oct 2021 22:09:32 +0200
Message-Id: <163532324662.18245.12411673920991418196.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211025151536.1048186-2-maxime@cerno.tech>
References: <20211025151536.1048186-1-maxime@cerno.tech> <20211025151536.1048186-2-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 25 Oct 2021 17:15:16 +0200, Maxime Ripard wrote:
> Let's switch to the new devm MIPI-DSI function to register and attach
> our secondary device. This also avoids leaking the device when we detach
> the bridge.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
