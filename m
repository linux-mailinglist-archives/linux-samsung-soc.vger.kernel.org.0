Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20ACC522669
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 10 May 2022 23:41:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229508AbiEJVln (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 10 May 2022 17:41:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbiEJVlm (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 10 May 2022 17:41:42 -0400
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4294448E40
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 May 2022 14:41:39 -0700 (PDT)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20220510214135euoutp0216f322c6fa2554783bae15422f1e417a~t3FUDOhQn3241932419euoutp02T
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 May 2022 21:41:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20220510214135euoutp0216f322c6fa2554783bae15422f1e417a~t3FUDOhQn3241932419euoutp02T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1652218896;
        bh=7SlMlZfYr3nbsxyWqJP3nACXO9mD9BUI4I/fN+ZyCIc=;
        h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
        b=jvpxyR/0cBDP9k62pYyHrv5UclcQuaLlQcOWUnzJZNtY32u8/hzaBKtqX4yTmJUTq
         /j5qG1iUUG4WmrJQJbphUyOjWBumrnqhOXShwa+tONlP1dqv/MZEObFGoR8zoXraXd
         Q7hVlL5nmexlPyTFUcRGFYLp5UG12JLlhHEUKiXo=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20220510214134eucas1p19cbac408364a5f342672e1c78053aeab~t3FTBCy3G0228602286eucas1p1E;
        Tue, 10 May 2022 21:41:34 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id FE.8F.10009.E0CDA726; Tue, 10
        May 2022 22:41:34 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20220510214134eucas1p22f0695c02402de0b8b6c21c09188b0de~t3FSNpGGg1983719837eucas1p28;
        Tue, 10 May 2022 21:41:34 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220510214133eusmtrp1967db239c2d5b61bf88cf0bc7b7adab0~t3FSK0HGU1028110281eusmtrp16;
        Tue, 10 May 2022 21:41:33 +0000 (GMT)
X-AuditID: cbfec7f2-e95ff70000002719-da-627adc0e6cbd
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 2D.C2.09522.D0CDA726; Tue, 10
        May 2022 22:41:33 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220510214132eusmtip231609e61b83d690dd3317433b450a819~t3FRGan7I1357113571eusmtip2f;
        Tue, 10 May 2022 21:41:32 +0000 (GMT)
Message-ID: <68bb83a7-764c-dd1b-0ed4-d2b6f2cfbb7c@samsung.com>
Date:   Tue, 10 May 2022 23:41:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
        Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v2 08/12] drm: bridge: samsung-dsim: Add atomic_check
Content-Language: en-US
To:     Jagan Teki <jagan@amarulasolutions.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Fancy Fang <chen.fang@nxp.com>,
        Tim Harvey <tharvey@gateworks.com>,
        Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
        Adam Ford <aford173@gmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
Cc:     Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20220504114021.33265-9-jagan@amarulasolutions.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01SfUxTVxzN63t9fTQreRSxN84A65REkxXrR3ZdkThLlueyr4DLFs0yij4+
        IhTWwkQyoSNhKaXUCovAm5surQGJgFahSljRzgFbIx1zNKy0VKgxlvIxoLqOWTbb5zb+O/f8
        fuece24ugQrr8U1EkbKcVikVxWKcj/UN/el8Jd5TlbfjUkQCPZMOFPpMKxgMTnbg8NfHizhs
        vDjKhU0+IwZDFiMOH02NYfBu7RwP1p8x82C70YZDi9/FhbrVSyhsddo40DHTg8KfPq/DoN1w
        BC4z08/45gAOx0aWUfjHX3fR/UlU15KPSy1O1PGoL0fucKlRvRenbjJeHvWVto1LmQYCHOrO
        uIlLeVwDOOVrGOZQ18w11NWFGxzKcL0ToVYsye/FH+ZnHKOLiz6lVemZufzCtkE/r8yeWBn2
        2RANoiF1CEEAcjdobufpED4hJDsQUB/s57KHEAIsY104e1hBQKB7CtUhcTGFI6DF2EE7Avoj
        f/OiAyG5hIAnXalRLCAzwWK4Fo9GYORW8H1dJksngB/bHmBRnETmgbm58ZhnInkQLAzditmg
        pAi4H5znRPEGsokLakOiaBYatdeHp2MCnJQC3bwOj+I4cj8wDwUxVpwCrPPnnl9UxwePewm2
        ZhbQ+uUsnQhmh6/zWLwZOJr1GLtSCiKtu1i6EriCl5+7yIBndDXWBCW3gZ7+dJZ+HdyPPOSw
        yngwMZ/A5seDpr4WlKUFQPuFkN1OA8xw93+Zt3/+BTUiYmbdkzDrqjPrmjD/515AsE5ERFeo
        SwpotVRJn5CoFSXqCmWB5GhpiQV59lsda8PLN5CvZ5ckdoRDIHYEEKh4g2DQUJknFBxTnKyi
        VaUfqyqKabUdeZHAxCLB0aIrCiFZoCinj9N0Ga36d8oh4jZpOI1bNuZoyaaN35yyZjuZe7bG
        g+f3TQ+Y3eJPPKdDyW+lyzOSP5jCPxzc/fC7XXys5TTPLSWeKnKte7fP/Z5SFmrPOfWmseFV
        4/yBt8eO75lZO7JWlXrYu0fr7fH3vOsvuZJ/Qlje6FIeyk+qXg2GzVlK9VD9C7KUQzdFOy/U
        fFahfyNDbqhCe1H9++4Jq1PTNpL/8rYn0+G03I6zZz4al1YDG52aVfjaAedMtWZh66Mf7u+8
        3d0lC5i4dYyr9WxD76j/5A5eQuflbDlzryDNdfFW3jmZVyKocTy9qmZMm60t6VuyZ9+59pIe
        k/flAkhzZIbFyX1ubmTvbzkeaehbvhhTFyqk21GVWvEPu6X01BwEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEKsWRmVeSWpSXmKPExsVy+t/xe7q8d6qSDP5ONra4c/s0s8X9xZ9Z
        LF7fXsFmceXrezaL3qXnWC0m3Z/AYvFl0wQ2ixf3LrJYnG16w27ROXEJu8XyCfvYLDY9vsZq
        0fVrJbPFjPP7mCxOP1rPbHGqsZXF4lBftMWnWQ+B4pNfsllcPPGJ2eL777PMDqIeaz/eZ/V4
        f6OV3WPKiSOsHud67rJ57Jx1l91jdsdMVo/Fe14yeRy5upjV4861PWwe97uPM3lsXlLvsfHd
        DiaPvi2rGD0+b5IL4IvSsynKLy1JVcjILy6xVYo2tDDSM7S00DMysdQzNDaPtTIyVdK3s0lJ
        zcksSy3St0vQy5i5/zF7wSHhih/39zE2MDYIdDFyckgImEicftnB0sXIxSEksJRR4tjXi4wQ
        CRmJk9MaWCFsYYk/17rYIIreM0o0N39kAknwCthJvP/RBJTg4GARUJU43GoHERaUODnzCQtI
        WFQgSeLIYX6QsLCAp8S7YwfYQWxmAXGJW0/mM4GMFBGYxipx7+1XsPnMAh8ZJS5N3sIOsewk
        o8TMO7+YQVrYBAwlut6CXMHJwSngILHk2GsWiFFmEl1buxghbHmJ7W/nME9gFJqF5JBZSDbO
        QtIyC0nLAkaWVYwiqaXFuem5xYZ6xYm5xaV56XrJ+bmbGIGJZduxn5t3MM579VHvECMTB+Mh
        RgkOZiUR3v19FUlCvCmJlVWpRfnxRaU5qcWHGE2BgTGRWUo0OR+Y2vJK4g3NDEwNTcwsDUwt
        zYyVxHk9CzoShQTSE0tSs1NTC1KLYPqYODilGpjW3neRV3Ca6O/4MXq9T++Uc+feqFecLZlz
        L1mWa3aCrmD8S/fre8N7XLxvP/nnduFO4vdp8+deDThc3vVz+cdn8as9i6qW1h/t/u6wZGXL
        sS1aL00mxyUXT69/tkj5moZ05uV9u3ijPtk+jbx3tQqYEFa8/5W/482OnxlPv/nPlCyV173p
        ZX8tdZbZiTM6kocsHi/4Hzj/97bbirvv//4sfeA7r2ZEQN+jWhtm89MNjj2WMQWTaiXv2b+2
        bHt6r0rym9UjR6+cmRySRZ+6TNkENwSWBF06N6E3Ocrh6/cv6vHzpj+a893prJTxnGUzNjrP
        Ewr1FdmwNqv9RvQPbUYFQ8570l8sf7//zPaw5rCSEktxRqKhFnNRcSIAfP658LUDAAA=
X-CMS-MailID: 20220510214134eucas1p22f0695c02402de0b8b6c21c09188b0de
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20220504114145eucas1p16d51cd7ba0bcb68b5e746b6554d121f1
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220504114145eucas1p16d51cd7ba0bcb68b5e746b6554d121f1
References: <20220504114021.33265-1-jagan@amarulasolutions.com>
        <CGME20220504114145eucas1p16d51cd7ba0bcb68b5e746b6554d121f1@eucas1p1.samsung.com>
        <20220504114021.33265-9-jagan@amarulasolutions.com>
X-Spam-Status: No, score=-8.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 04.05.2022 13:40, Jagan Teki wrote:
> Fixing up the mode flags is required in order to correlate the
> correct sync flags of the surrounding components in the chain
> to make sure the whole pipeline can work properly.
>
> So, handle the mode flags via bridge, atomic_check.
>
> v2:
> * none
>
> v1:
> * fix mode flags in atomic_check instead of mode_fixup
>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>   drivers/gpu/drm/bridge/samsung-dsim.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> index b618e52d0ee3..bd78cef890e4 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1340,6 +1340,19 @@ static void samsung_dsim_atomic_post_disable(struct drm_bridge *bridge,
>   	pm_runtime_put_sync(dsi->dev);
>   }
>   
> +static int samsung_dsim_atomic_check(struct drm_bridge *bridge,
> +				     struct drm_bridge_state *bridge_state,
> +				     struct drm_crtc_state *crtc_state,
> +				     struct drm_connector_state *conn_state)
> +{
> +	struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
> +
> +	adjusted_mode->flags |= (DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);

Could you point why this change is needed? It breaks display on Samsung 
s6e8aa0 dsi panel (Trats and Trats2 boards) and tc358764 bridge (Arndale 
board). I have no detailed knowledge of the DSI protocol nor those 
panels/bridges. If there is something missing in the drivers for those 
panels/bridges, let me know.


> +	adjusted_mode->flags &= ~(DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
> +
> +	return 0;
> +}
> +
>   static void samsung_dsim_mode_set(struct drm_bridge *bridge,
>   				  const struct drm_display_mode *mode,
>   				  const struct drm_display_mode *adjusted_mode)
> @@ -1361,6 +1374,7 @@ static const struct drm_bridge_funcs samsung_dsim_bridge_funcs = {
>   	.atomic_duplicate_state		= drm_atomic_helper_bridge_duplicate_state,
>   	.atomic_destroy_state		= drm_atomic_helper_bridge_destroy_state,
>   	.atomic_reset			= drm_atomic_helper_bridge_reset,
> +	.atomic_check			= samsung_dsim_atomic_check,
>   	.atomic_pre_enable		= samsung_dsim_atomic_pre_enable,
>   	.atomic_enable			= samsung_dsim_atomic_enable,
>   	.atomic_disable			= samsung_dsim_atomic_disable,

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

