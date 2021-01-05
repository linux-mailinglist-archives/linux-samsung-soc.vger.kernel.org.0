Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76FAA2EA432
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  5 Jan 2021 05:03:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727458AbhAEECI (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 4 Jan 2021 23:02:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726168AbhAEECI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 4 Jan 2021 23:02:08 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAA40C061574;
        Mon,  4 Jan 2021 20:01:27 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id o13so69593790lfr.3;
        Mon, 04 Jan 2021 20:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=SQQuOKC1O0sf7eW3BCMzk/TTSkOU/Wo1ZPhVnA2VyuU=;
        b=pofi22Yd5VW1o8B824chIwbMBxC2hE6GILeV7bxPEdAxPGOpfffZlp8k2E4gK0JICe
         DN+KKIJ1vYB20DDYeBQFUSk4SemoWoHJMTDv6wSm87FCOkeGYbdW05SojFh4ZoHk/+z4
         fTLP4AMIXDJtvqUw+Mzz7iL3iyjWgzDItfwu9cSShDJo61lDdViOtayU/jY/gvaqKz9W
         536ujgrNGTDemv9U10UXZ9pxDDX/B6GenSeUR+WRhiwRx3jV5cw+fQXCnj9g0T27nS6x
         SE/xI+QWrUm3xX4Pgjqh3moeCucwx0iO4q6v+nXQGeCcyQxr2Ur+GEeeqiI5CiS8SLyJ
         oKlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=SQQuOKC1O0sf7eW3BCMzk/TTSkOU/Wo1ZPhVnA2VyuU=;
        b=VJI6MkmKtOH8aOHQskWnXnfGQNUBTLrisdNoBGBtBFEbdnIfu+PIsOnIKNMujgho2d
         CJHEe+HygszZl6l7OCGFf0TqUGsqo1k+SZCRTgDbYKPAS0YwQ4mdaW9Lu5QtaaFppmLB
         eFdzoNiDncDwmsxLcoQzfKtWHMzGZBzX0WpmWvuEJR4cuVCpbOZzGgB5zi8VIIS+L8QL
         AUn4sc3FLxhuMzA3IP0ESXTIAO58kpJ8GFGgukQWkk8a4j7gvHdj/Zb743F09DhYWxAt
         AMFevNDbp25bKa7SFnl5cqxf/KwovQZOpV2d+GRzClaQx5X5c/3MQgsy893x35K0wEQl
         DZDw==
X-Gm-Message-State: AOAM533rXtY1oLCgcGGdtjPo+Mpk8doKwtolXqz/Y3ZQURqL4+wpcvAB
        1Hq/iRNcFaBI0LtPVDnB9DNVgaPSqzMy9rQZ4Ok=
X-Google-Smtp-Source: ABdhPJxu21uHjyNWjYVVrY0kCQTURSa+kVb4E4YJv2XQs1DWZtV8BvIeHMut8ZaNQpth2To8kl++bOQ/w6Wk8MYKT9w=
X-Received: by 2002:a19:4316:: with SMTP id q22mr17269237lfa.106.1609819286213;
 Mon, 04 Jan 2021 20:01:26 -0800 (PST)
MIME-Version: 1.0
References: <20210103035514.23788-1-tiny.windzz@gmail.com>
In-Reply-To: <20210103035514.23788-1-tiny.windzz@gmail.com>
Reply-To: cwchoi00@gmail.com
From:   Chanwoo Choi <cwchoi00@gmail.com>
Date:   Tue, 5 Jan 2021 13:00:49 +0900
Message-ID: <CAGTfZH0DHXZqtiXNZrMA=pZMDG3zZpFez_sPvteAQgHXBs5WYQ@mail.gmail.com>
Subject: Re: [PATCH 27/31] PM / devfreq: rk3399_dmc: convert to use
 devm_pm_opp_* API
To:     Yangtao Li <tiny.windzz@gmail.com>
Cc:     MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com,
        dl-linux-imx <linux-imx@nxp.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>, yuq825@gmail.com,
        David Airlie <airlied@linux.ie>, daniel@ffwll.ch,
        robdclark@gmail.com, sean@poorly.run,
        Rob Herring <robh@kernel.org>, tomeu.vizoso@collabora.com,
        steven.price@arm.com, alyssa.rosenzweig@collabora.com,
        stanimir.varbanov@linaro.org, agross@kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        mchehab@kernel.org, Lukasz Luba <lukasz.luba@arm.com>,
        adrian.hunter@intel.com, Ulf Hansson <ulf.hansson@linaro.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>, jirislaby@kernel.org,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>, jcrouse@codeaurora.org,
        hoegsberg@google.com, eric@anholt.net, tzimmermann@suse.de,
        marijn.suijten@somainline.org, gustavoars@kernel.org,
        emil.velikov@collabora.com, jonathan@marek.ca,
        akhilpo@codeaurora.org, smasetty@codeaurora.org,
        airlied@redhat.com, masneyb@onstation.org, kalyan_t@codeaurora.org,
        tanmay@codeaurora.org, ddavenport@chromium.org,
        jsanka@codeaurora.org, rnayak@codeaurora.org,
        tongtiangen@huawei.com, miaoqinglang@huawei.com,
        khsieh@codeaurora.org, abhinavk@codeaurora.org,
        chandanu@codeaurora.org, Guenter Roeck <groeck@chromium.org>,
        varar@codeaurora.org, Matthias Kaehlcke <mka@chromium.org>,
        harigovi@codeaurora.org, rikard.falkeborn@gmail.com,
        natechancellor@gmail.com, Georgi Djakov <georgi.djakov@linaro.org>,
        akashast@codeaurora.org, parashar@codeaurora.org,
        Doug Anderson <dianders@chromium.org>,
        Linux PM list <linux-pm@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-tegra@vger.kernel.org,
        dri-devel <dri-devel@lists.freedesktop.org>,
        lima@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-media@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

Do you make this patch on latest source?
When I apply this patch for test, it make the merge conflict error.

On Sun, Jan 3, 2021 at 12:57 PM Yangtao Li <tiny.windzz@gmail.com> wrote:
>
> Use devm_pm_opp_* API to simplify code. Since devres release
> can guarantee the order, let's remove
> devm_devfreq_unregister_opp_notifier().
>
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> ---
>  drivers/devfreq/rk3399_dmc.c | 22 +++-------------------
>  1 file changed, 3 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/devfreq/rk3399_dmc.c b/drivers/devfreq/rk3399_dmc.c
> index 2e912166a993..9b8ab8be29d1 100644
> --- a/drivers/devfreq/rk3399_dmc.c
> +++ b/drivers/devfreq/rk3399_dmc.c
> @@ -432,7 +432,7 @@ static int rk3399_dmcfreq_probe(struct platform_device *pdev)
>          * We add a devfreq driver to our parent since it has a device tree node
>          * with operating points.
>          */
> -       if (dev_pm_opp_of_add_table(dev)) {
> +       if (devm_pm_opp_of_add_table(dev)) {
>                 dev_err(dev, "Invalid operating-points in device tree.\n");
>                 ret = -EINVAL;
>                 goto err_edev;
> @@ -448,7 +448,7 @@ static int rk3399_dmcfreq_probe(struct platform_device *pdev)
>         opp = devfreq_recommended_opp(dev, &data->rate, 0);
>         if (IS_ERR(opp)) {
>                 ret = PTR_ERR(opp);
> -               goto err_free_opp;
> +               goto err_edev;
>         }
>
>         data->rate = dev_pm_opp_get_freq(opp);
> @@ -463,7 +463,7 @@ static int rk3399_dmcfreq_probe(struct platform_device *pdev)
>                                            &data->ondemand_data);
>         if (IS_ERR(data->devfreq)) {
>                 ret = PTR_ERR(data->devfreq);
> -               goto err_free_opp;
> +               goto err_edev;
>         }
>
>         devm_devfreq_register_opp_notifier(dev, data->devfreq);
> @@ -473,27 +473,12 @@ static int rk3399_dmcfreq_probe(struct platform_device *pdev)
>
>         return 0;
>
> -err_free_opp:
> -       dev_pm_opp_of_remove_table(&pdev->dev);
>  err_edev:
>         devfreq_event_disable_edev(data->edev);
>
>         return ret;
>  }
>
> -static int rk3399_dmcfreq_remove(struct platform_device *pdev)
> -{
> -       struct rk3399_dmcfreq *dmcfreq = dev_get_drvdata(&pdev->dev);
> -
> -       /*
> -        * Before remove the opp table we need to unregister the opp notifier.
> -        */
> -       devm_devfreq_unregister_opp_notifier(dmcfreq->dev, dmcfreq->devfreq);
> -       dev_pm_opp_of_remove_table(dmcfreq->dev);

As the comment, we need to unregister the opp notifier before removing the OPP.
Do you guarantee this sequence on your patch?


> -
> -       return 0;
> -}
> -
>  static const struct of_device_id rk3399dmc_devfreq_of_match[] = {
>         { .compatible = "rockchip,rk3399-dmc" },
>         { },
> @@ -502,7 +487,6 @@ MODULE_DEVICE_TABLE(of, rk3399dmc_devfreq_of_match);
>
>  static struct platform_driver rk3399_dmcfreq_driver = {
>         .probe  = rk3399_dmcfreq_probe,
> -       .remove = rk3399_dmcfreq_remove,
>         .driver = {
>                 .name   = "rk3399-dmc-freq",
>                 .pm     = &rk3399_dmcfreq_pm,
> --
> 2.25.1
>


-- 
Best Regards,
Chanwoo Choi
