Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E7ED43D26E
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 27 Oct 2021 22:11:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243932AbhJ0UNj (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 27 Oct 2021 16:13:39 -0400
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27]:49359 "EHLO
        wnew2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243855AbhJ0UNd (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 27 Oct 2021 16:13:33 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.west.internal (Postfix) with ESMTP id AC8462B0145C;
        Wed, 27 Oct 2021 16:11:05 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Wed, 27 Oct 2021 16:11:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-type:content-transfer-encoding; s=fm1; bh=
        fesgqNtZBG1OUNZNDS6pXSeSxFh1EPyXvlZgyE9FBR4=; b=iAVD9GNcqUaj8Obe
        5t6IjgQP0jgoW0WLkA0e/DCNGDzmrz2FERKkJDmK54mjbam7GvTp4ZkPJm+ddkGs
        0+ev6UoSQH3F8bgzl1c36W0tMtX8X8bB3MzOD16bTpkfrOeKWYj6X8d5N68xjF75
        c/yK2raj1VzDhKPd68Xrjzht1c1H5p8HACsWqJ7Pl43szbZjV3Aic2JREUrXe2Iu
        D9bQdKaANvbh84FqnmsPFO3dzP9IyTYF3TuNRWpac1robT91XcNyUwNBGHQLLPRS
        20cwnclHSZCXFvNH8/vTlUMElYe8/W+FwrBioXINpWqDlQyYf3jHfaRX77+kAAKB
        bJZq6A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=fesgqNtZBG1OUNZNDS6pXSeSxFh1EPyXvlZgyE9FB
        R4=; b=Ef8UEmAIszXLXZC/rEb7t4jbsLyRmW9LLy0UmIaOnhmFWWEQiYVNjci4e
        2SxjaBRbswO2QfhGnPQTS+9IBDXd9iKdl1wS/3ZgMxuyS/VkJ+7iSY9T9plpyCLE
        4XCMXk1p9KrI3U6jLJw/7TkFhLXDzPofh7Dt61fHzBGyXZRAXZltcPnWynRi6EId
        TbZEzMKVirorSJA5EElLIKjbc//TlTSAwJgdjvfRs97Os+l/9nrch8bYwlWsoofh
        wQFH0lCMP1e8SPdYWN7O0IM+pPc8dUGU3ueAVRpBDE1rFo1FNsb5T3ThrOu1TEGI
        mtrAzZe5aINui6ZmRXi285caKy/6Q==
X-ME-Sender: <xms:WLJ5YUQh21HiTvBHQT2cQLVpsufTIOzTNh77lIyuzkgXg2LKWMWTfw>
    <xme:WLJ5YRxe1qTuGsap7tvg6UJ-H1Cxa-09nRCI4kjGzHI_aj3Z2h2JZyWotccPtPBH1
    ACJaOW7JcFKyN3anfo>
X-ME-Received: <xmr:WLJ5YR2SA8k2Tj8cO2TN0tJOGutnibm425sOVjvAZ6nSaDLcw0ztXLGyYFvS1Y6WOn3AusokpXLNA-sySc7zUgW8ZqdbU4iwwg96x_fR>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdegtddguddutdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepjeeugfegkeffgfeuvedtvddufffhjeffjeejvddvudduteehhfefhfef
    geeikeeknecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:WLJ5YYCwaumgaAFf8CID1ZhmQG7pHZtyg-kgmae_Rj5oIB9jPng7Qg>
    <xmx:WLJ5YdjqQy80ptuStxRkSzwwGO6W2koiFMKc3sqKOXfcJqmYl0kLwQ>
    <xmx:WLJ5YUqq73RFGc9R7TPjiA_pHxK4JGlVzLVHeNyVMaevRlgvnIKPpA>
    <xmx:WbJ5YTMcSXa4l1Q_7dIflfLTGCCawJ5JxCZCZeIr0Rv4Ga6mG0IawJ0RcLA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 27 Oct 2021 16:11:04 -0400 (EDT)
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
        Marek Vasut <marex@denx.de>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Chen Feng <puck.chen@hisilicon.com>,
        linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Inki Dae <inki.dae@samsung.com>, Sean Paul <sean@poorly.run>,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Xinliang Liu <xinliang.liu@linaro.org>
Subject: Re: (subset) [PATCH v6 13/21] drm/bridge: sn65dsi83: Fix bridge removal
Date:   Wed, 27 Oct 2021 22:09:44 +0200
Message-Id: <163532324664.18245.16048406217124194602.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211025151536.1048186-14-maxime@cerno.tech>
References: <20211025151536.1048186-1-maxime@cerno.tech> <20211025151536.1048186-14-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 25 Oct 2021 17:15:28 +0200, Maxime Ripard wrote:
> Commit 24417d5b0c00 ("drm/bridge: ti-sn65dsi83: Implement .detach
> callback") moved the unregistration of the bridge DSI device and bridge
> itself to the detach callback.
> 
> While this is correct for the DSI device detach and unregistration, the
> bridge is added in the driver probe, and should thus be removed as part
> of its remove callback.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
