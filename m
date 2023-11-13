Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CF867E959F
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 13 Nov 2023 04:42:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233041AbjKMDmv (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sun, 12 Nov 2023 22:42:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233030AbjKMDmt (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 12 Nov 2023 22:42:49 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6765AC2;
        Sun, 12 Nov 2023 19:42:38 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5D424C433A9;
        Mon, 13 Nov 2023 03:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1699846957;
        bh=cJ8SO9nHStzpr3oXPb7av3bgl8Tcpca5hNprBHV/N28=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=C8SpIn2tY/7fXB31TZP/dWpZaDTw/62k6g4tlpCvWJe8qHTZfpYQjd3y+YLI5nBE4
         fyMvoUDNzIKMT8JJ5Htho8s5Uu1M8SGAWp0XQkPn7PcoaByfme0zMmW72J514kWAHG
         F9wQN1jdfwOmPTG140W0KtlGwo0cojQpZv/2bwzMExIlYnRHulwVjpET5nR08M2bdc
         TqtirqbOAnA4XVobjw23mWE5BVPFVlg7xxZ+Bqr78n52VXqisW5Spz+H272fvkcS2h
         KX9KoAsq+DQks/aCCs9wbtN03+2gZROK5W/4Om0F8XmTERr2gL2HcZe54Bu6JDxuzZ
         r9MQS+Ox++w/g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 42EF0E32713;
        Mon, 13 Nov 2023 03:42:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 00/11] pwm: Some random cleanups
From:   patchwork-bot+chrome-platform@kernel.org
Message-Id: <169984695726.27851.13669359459890665308.git-patchwork-notify@kernel.org>
Date:   Mon, 13 Nov 2023 03:42:37 +0000
References: <20230929161918.2410424-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230929161918.2410424-1-u.kleine-koenig@pengutronix.de>
To:     =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=3Cu=2Ekleine-koenig=40pengutronix=2Ede=3E?=@ci.codeaurora.org
Cc:     thierry.reding@gmail.com, rjui@broadcom.com, sbranden@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com, linux-pwm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
        florian.fainelli@broadcom.com,
        linux-rpi-kernel@lists.infradead.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
        linux-mediatek@lists.infradead.org, orsonzhai@gmail.com,
        baolin.wang@linux.alibaba.com, zhang.lyra@gmail.com,
        krzysztof.kozlowski@linaro.org, alim.akhtar@samsung.com,
        linux-samsung-soc@vger.kernel.org, bleung@chromium.org,
        groeck@chromium.org, chrome-platform@lists.linux.dev
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hello:

This patch was applied to chrome-platform/linux.git (for-next)
by Thierry Reding <thierry.reding@gmail.com>:

On Fri, 29 Sep 2023 18:19:07 +0200 you wrote:
> Hello,
> 
> this is a set of patches I based my efforts for closing a race condition
> in the pwm core on. I thought I already sent them out, but it seems I
> didn't. So here they come!
> 
> Best regards
> Uwe
> 
> [...]

Here is the summary with links:
  - [11/11] pwm: cros-ec: Simplify using devm_pwmchip_add() and dev_err_probe()
    https://git.kernel.org/chrome-platform/c/896c450960f5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


