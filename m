Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFA4F36D2E5
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 28 Apr 2021 09:17:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230186AbhD1HR6 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 28 Apr 2021 03:17:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:35106 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229478AbhD1HR6 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 28 Apr 2021 03:17:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D6EA5613D9;
        Wed, 28 Apr 2021 07:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619594233;
        bh=bT0Ps7h9X1GHDN7nmBizYpviCK9XLqQX3fIM/sSpyw4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=YLucjFrCyu9B8oYM8Xcn5lgd0vbes/JKahB86wP/s3gdYFjv9weCfDm/g8TrSOTbn
         NoKBcanjBRXgVisRMEBubHiOW3OnR3+1wVpxT70B50H9qPV5orysMf7XqGCPJ5xpAd
         HMQl4zDNydgjPgm9xbDgpcia/fogfEL3ZhFzmre12lRsBog9YoVlePLhQCoMV8CCX/
         V1cj1oM2iuKE2OKPoYglyiNnzYU8z/sM0vEV6Zcq4Mi1WhzeeJyvEzZK6ws6xbI6Nf
         CnCTP8Cb7CpRqmA6kf4G+v650XQAhwJRKOy+1McYuo95blG8aLkhF10RjDpVNhlBmR
         FeUQD43zDzVVA==
Date:   Wed, 28 Apr 2021 09:17:07 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 58/78] media: exynos-gsc: use
 pm_runtime_resume_and_get()
Message-ID: <20210428091707.3c99d124@coco.lan>
In-Reply-To: <20210428091302.64af1e5d@coco.lan>
References: <cover.1619191723.git.mchehab+huawei@kernel.org>
        <CGME20210424064556eucas1p1e89378837c377168c9782b4172e70482@eucas1p1.samsung.com>
        <9c7d683907b9f9cf4a99f57f978671ec7f5a1dbc.1619191723.git.mchehab+huawei@kernel.org>
        <ee7b580a-d5bc-bdbf-3efc-c9d8f43316db@samsung.com>
        <20210427113055.745d0560@coco.lan>
        <20210427114235.45a7b2a4@coco.lan>
        <5f6088c7-c839-f097-737f-b4234c413eac@samsung.com>
        <20210428091302.64af1e5d@coco.lan>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Em Wed, 28 Apr 2021 09:13:02 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:

> Em Tue, 27 Apr 2021 13:50:44 +0200
> Sylwester Nawrocki <s.nawrocki@samsung.com> escreveu:
> 
> > On 27.04.2021 11:42, Mauro Carvalho Chehab wrote:  
> > > Em Tue, 27 Apr 2021 11:30:55 +0200
> > > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:
> > >     
> > >> Em Tue, 27 Apr 2021 10:18:12 +0200
> > >> Sylwester Nawrocki <s.nawrocki@samsung.com> escreveu:
> > >>    
> > >>> On 24.04.2021 08:45, Mauro Carvalho Chehab wrote:      
> > >>>> Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> > >>>> added pm_runtime_resume_and_get() in order to automatically handle
> > >>>> dev->power.usage_count decrement on errors.
> > >>>>
> > >>>> Use the new API, in order to cleanup the error check logic.
> > >>>>
> > >>>> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > >>>> ---
> > >>>>  drivers/media/platform/exynos-gsc/gsc-core.c | 3 +--
> > >>>>  drivers/media/platform/exynos-gsc/gsc-m2m.c  | 2 +-
> > >>>>  2 files changed, 2 insertions(+), 3 deletions(-)
> > >>>>
> > >>>> diff --git a/drivers/media/platform/exynos-gsc/gsc-core.c b/drivers/media/platform/exynos-gsc/gsc-core.c
> > >>>> index 9f41c2e7097a..9d5841194f6b 100644
> > >>>> --- a/drivers/media/platform/exynos-gsc/gsc-core.c
> > >>>> +++ b/drivers/media/platform/exynos-gsc/gsc-core.c
> > >>>> @@ -1210,7 +1210,7 @@ static int gsc_remove(struct platform_device *pdev)
> > >>>>  	struct gsc_dev *gsc = platform_get_drvdata(pdev);
> > >>>>  	int i;
> > >>>>  
> > >>>> -	pm_runtime_get_sync(&pdev->dev);
> > >>>> +	pm_runtime_resume_and_get(&pdev->dev);
> > >>>>  
> > >>>>  	gsc_unregister_m2m_device(gsc);
> > >>>>  	v4l2_device_unregister(&gsc->v4l2_dev);
> > >>>> @@ -1219,7 +1219,6 @@ static int gsc_remove(struct platform_device *pdev)
> > >>>>  	for (i = 0; i < gsc->num_clocks; i++)
> > >>>>  		clk_disable_unprepare(gsc->clock[i]);
> > >>>>  
> > >>>> -	pm_runtime_put_noidle(&pdev->dev);        
> > >>>
> > >>> If we do this then the device usage count will not get decremented
> > >>> after the pm_runtime_resume_and_get() call above and after driver
> > >>> unload/load cycle it will not be possible to suspend the device.
> > >>> I wouldn't be changing anything in gsc_remove(), pm_runtime_get_sync()
> > >>> works better in that case.      
> > >>
> > >> Good point.
> > >>
> > >> Actually, I don't see any reason why to call a PM resume
> > >> function - either being pm_runtime_get_sync() or
> > >> pm_runtime_resume_and_get().
> > >>
> > >> The code there could simply be:
> > >>
> > >>     static int gsc_remove(struct platform_device *pdev)
> > >>     {
> > >>         struct gsc_dev *gsc = platform_get_drvdata(pdev);
> > >>         int i;
> > >>
> > >>         gsc_unregister_m2m_device(gsc);
> > >>         v4l2_device_unregister(&gsc->v4l2_dev);
> > >>
> > >>         vb2_dma_contig_clear_max_seg_size(&pdev->dev);
> > >>         for (i = 0; i < gsc->num_clocks; i++)
> > >>                 clk_disable_unprepare(gsc->clock[i]);
> > >>
> > >>         pm_runtime_disable(&pdev->dev);
> > >>
> > >>         dev_dbg(&pdev->dev, "%s driver unloaded\n", pdev->name);
> > >>         return 0;
> > >>     }
> > >>
> > >> Eventually also adding:
> > >> 	pm_runtime_suspended(&pdev->dev);    
> > > 
> > > In time: I actually meant:
> > > 
> > > 	pm_runtime_set_suspended(&pdev->dev);
> > > 
> > > but after double-checking the PM runtime code, it sounds to me that
> > > just calling pm_runtime_disable() would be enough. Not 100% sure
> > > here. Btw, some media drivers call it after pm_runtime_disable(),
> > > while others don't do.    
> > 
> > I think if the device is brought into suspended state (e.g. by
> > disabling clocks as above) the pm_runtime_set_suspended() call
> > should be there. IOW a following sequence: 
> > 
> > 	pm_runtime_disable(dev);
> > 	if (!pm_runtime_status_suspended(dev))
> > 		/* put device into suspended state (disable clocks, 
> > 		  voltage regulators, assert GPIOs, etc. */
> > 	pm_runtime_set_suspended(dev);  
> 
> Not sure if this would work, as the clock framework would try
> to do things like calling clk_pm_runtime_put().
> 
> Perhaps an alternative would be to just return an error if it
> can't resume PM runtime, e. g.:
> 
> diff --git a/drivers/media/platform/exynos-gsc/gsc-core.c b/drivers/media/platform/exynos-gsc/gsc-core.c
> index 9f41c2e7097a..d47d02c75484 100644
> --- a/drivers/media/platform/exynos-gsc/gsc-core.c
> +++ b/drivers/media/platform/exynos-gsc/gsc-core.c
> @@ -1208,9 +1208,11 @@ static int gsc_probe(struct platform_device *pdev)
>  static int gsc_remove(struct platform_device *pdev)
>  {
>         struct gsc_dev *gsc = platform_get_drvdata(pdev);
> -       int i;
> +       int ret, i;
>  
> -       pm_runtime_get_sync(&pdev->dev);
> +       ret = pm_runtime_resume_and_get(&pdev->dev);
> +       if (ret < 0)
> +               return ret;

Nah, forget about that. Despite the platform driver having a return code,
support for it bogus:


static int platform_remove(struct device *_dev)
{
        struct platform_driver *drv = to_platform_driver(_dev->driver);
        struct platform_device *dev = to_platform_device(_dev);

        if (drv->remove) {
                int ret = drv->remove(dev);

                if (ret)
                        dev_warn(_dev, "remove callback returned a non-zero value. This will be ignored.\n");
        }
        dev_pm_domain_detach(_dev, true);

        return 0;
}

Thanks,
Mauro
