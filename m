Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3257C36B3DF
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 26 Apr 2021 15:12:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233593AbhDZNNO (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 26 Apr 2021 09:13:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:44526 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233619AbhDZNNM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 26 Apr 2021 09:13:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 03E7261004;
        Mon, 26 Apr 2021 13:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619442750;
        bh=TCDuDstO9e95vazIQML7aqZR4Hmg3mT1Cxd58/uWeSw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=pUH684qOqUDJgOlYcDoFLa2K5c9Q4dqYcVtdex0Y+TdXkTX7AQINy/ApybdtQjBS/
         pqsOvvgeAEmCUuceaF/LGScZnKpJUEj39B2GpDwBrNB8Y7QQcd3QzecX61zLWChFWj
         axqBpXSHYeWtPKKYKda66tTTxZTjlgOzXu3jlhRW/JiXx2+KLQ5x+gL+x0Pd5adsf7
         MjaFLQg1NqlhwGEpT7sptL43SQgtXZjIXfxuT9wMQ43XNEVF6zfTFLaFSmiwr2Cc2I
         btFMkDVXxa81mzoDPPr/PBZ6VSxwy5//RlY8FwJxbK0LFdl2fKHEdMKj5Xep2r7HKP
         Oa99+jH98FxuA==
Date:   Mon, 26 Apr 2021 15:12:24 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Sylwester Nawrocki <snawrocki@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 57/78] media: exynos4-is: use
 pm_runtime_resume_and_get()
Message-ID: <20210426151224.2b677d1b@coco.lan>
In-Reply-To: <45068e81-8f9b-fea8-b7bc-bdd0443ba7e6@kernel.org>
References: <cover.1619191723.git.mchehab+huawei@kernel.org>
        <091915bb1cbec13b566d129f85ae229fcb92e2e4.1619191723.git.mchehab+huawei@kernel.org>
        <45068e81-8f9b-fea8-b7bc-bdd0443ba7e6@kernel.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Em Sun, 25 Apr 2021 22:57:25 +0200
Sylwester Nawrocki <snawrocki@kernel.org> escreveu:

> On 24.04.2021 08:45, Mauro Carvalho Chehab wrote:
> > Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> > added pm_runtime_resume_and_get() in order to automatically handle
> > dev->power.usage_count decrement on errors.
> > 
> > Use the new API, in order to cleanup the error check logic.
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > ---
> >   drivers/media/platform/exynos4-is/fimc-capture.c   | 6 ++----
> >   drivers/media/platform/exynos4-is/fimc-is.c        | 3 ++-
> >   drivers/media/platform/exynos4-is/fimc-isp-video.c | 3 +--
> >   drivers/media/platform/exynos4-is/fimc-isp.c       | 7 +++----
> >   drivers/media/platform/exynos4-is/fimc-lite.c      | 5 +++--
> >   drivers/media/platform/exynos4-is/fimc-m2m.c       | 2 +-
> >   drivers/media/platform/exynos4-is/media-dev.c      | 8 +++-----
> >   drivers/media/platform/exynos4-is/mipi-csis.c      | 5 ++---
> >   8 files changed, 17 insertions(+), 22 deletions(-)
> > 
> > diff --git a/drivers/media/platform/exynos4-is/fimc-capture.c b/drivers/media/platform/exynos4-is/fimc-capture.c
> > index 13c838d3f947..0da36443173c 100644
> > --- a/drivers/media/platform/exynos4-is/fimc-capture.c
> > +++ b/drivers/media/platform/exynos4-is/fimc-capture.c
> > @@ -478,11 +478,9 @@ static int fimc_capture_open(struct file *file)
> >   		goto unlock;
> >   
> >   	set_bit(ST_CAPT_BUSY, &fimc->state);
> > -	ret = pm_runtime_get_sync(&fimc->pdev->dev);
> > -	if (ret < 0) {
> > -		pm_runtime_put_sync(&fimc->pdev->dev);
> > +	ret = pm_runtime_resume_and_get(&fimc->pdev->dev);
> > +	if (ret < 0)
> >   		goto unlock;
> > -	}
> >   
> >   	ret = v4l2_fh_open(file);
> >   	if (ret) {
> > diff --git a/drivers/media/platform/exynos4-is/fimc-is.c b/drivers/media/platform/exynos4-is/fimc-is.c
> > index 972d9601d236..bca35866cc74 100644
> > --- a/drivers/media/platform/exynos4-is/fimc-is.c
> > +++ b/drivers/media/platform/exynos4-is/fimc-is.c
> > @@ -828,7 +828,7 @@ static int fimc_is_probe(struct platform_device *pdev)
> >   			goto err_irq;
> >   	}
> >   
> > -	ret = pm_runtime_get_sync(dev);
> > +	ret = pm_runtime_resume_and_get(dev);
> >   	if (ret < 0)
> >   		goto err_pm;  
> 
> It seems you intended to use err_suspend label here. We don't need
> a new label though, instead of err_pm we can jump to err_irq when
> pm_runtime_resume_and_get() fails. 

Thanks! Will fix at the next version.

> Note that when runtime PM is
> disabled pm_runtime_resume_and_get() always returns 0.

Ok, but there are a couple of conditions at rpm_resume() function
at drivers/base/power/runtime.c (which is the code that actually
handles those PM macros) that could make it to return errors,
which are independent on the PM callbacks, like those:

        if (dev->power.runtime_error)
                retval = -EINVAL;
        else if (dev->power.disable_depth > 0)
                retval = -EACCES;

and more might be added as the PM core changes.

> 
> > @@ -862,6 +862,7 @@ static int fimc_is_probe(struct platform_device *pdev)
> >   	fimc_is_unregister_subdevs(is);
> >   err_pm:
> >   	pm_runtime_put_noidle(dev);
> > +err_suspend:
> >   	if (!pm_runtime_enabled(dev))
> >   		fimc_is_runtime_suspend(dev);
> >   err_irq:  
> 
> 
> > diff --git a/drivers/media/platform/exynos4-is/mipi-csis.c b/drivers/media/platform/exynos4-is/mipi-csis.c
> > index 1aac167abb17..a0218237d66b 100644
> > --- a/drivers/media/platform/exynos4-is/mipi-csis.c
> > +++ b/drivers/media/platform/exynos4-is/mipi-csis.c
> > @@ -494,7 +494,7 @@ static int s5pcsis_s_power(struct v4l2_subdev *sd, int on)
> >   	struct device *dev = &state->pdev->dev;
> >   
> >   	if (on)
> > -		return pm_runtime_get_sync(dev);
> > +		return pm_runtime_resume_and_get(dev);
> >   
> >   	return pm_runtime_put_sync(dev);
> >   }
> > @@ -509,9 +509,8 @@ static int s5pcsis_s_stream(struct v4l2_subdev *sd, int enable)
> >   
> >   	if (enable) {
> >   		s5pcsis_clear_counters(state);
> > -		ret = pm_runtime_get_sync(&state->pdev->dev);
> > +		ret = pm_runtime_resume_and_get(&state->pdev->dev);
> >   		if (ret && ret != 1) {
> > -			pm_runtime_put_noidle(&state->pdev->dev);
> >   			return ret;
> >   		}  
> 
> Braces could be dropped as well here.

OK.

> 
> >   	}  
> 
> 
> Thanks,
> Sylwester
> 



Thanks,
Mauro
