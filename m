Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 606C143E77F
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 28 Oct 2021 19:46:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230420AbhJ1Rs1 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 28 Oct 2021 13:48:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230407AbhJ1Rs0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 28 Oct 2021 13:48:26 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDE8BC061570
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Oct 2021 10:45:59 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id h193so7171714pgc.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Oct 2021 10:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=RmyZkRmQgYlbiAhBNiJHNygZTa6g3tkTT/MK3HKeo6m/8GpG6UaUMwCgAsoyD4Fa+A
         ilOMGFe40HYNBBF7pfiEnPIHN2drUz99MQ33PiH5kUdW2A2MbkuK0Wy7zq/2lLjviaaP
         G9Zg49XpIP9aV3RkX07lC5blmK4e+sDkGEmWzlZYY2PdHUhlMjMPkjhQ8U/0vPdMMsON
         KjIkBfxinsSR9gsaAR0ZiHRsswz2E1tq4y7tQs6Z/38KwtrGsQhUMTrUGipQXLfePmCs
         1LXDBmqbe7/Ngqz+JGiwB2cM20XKqygBrNBtfacHP17nuFJYm+2GNN8jKS7NIHhUdMJt
         GOxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=R6Y7RZ0E2sXeV3YdvFFw8XiXdYX9Ba5cTgZfFzLsyj+qRDh5/YIwden0F17ihDkUeO
         vNK4tRfKMDffZjLnG5mslgQ+nfwj8PO9K5hLoJghaf3uJ8cmycmlKD6fKXq0AFPjiKOB
         WCnG4rV0Ysme8DVOrnXZT1gdH/w7k5n8pePDwEEmfoAl0iRzyD00P7OV0Vr+7fA6wUz8
         Bz75Pj2h5IzKHlFTUOV3xs/rj9OQCOydKAhvDKtHVw3XJ2R1CiU7M9mu6S4dQP5Qs1OY
         wRQeJXtwaQQsd/EZKkSD104Cs0HNDerwXCY56u9qC/odgXBSSgDyQn6vcDAF8PzanHob
         qKuQ==
X-Gm-Message-State: AOAM533DxNLBqu0ztq4qjECIHjm54BSB1/CfR2XMGE5WIeAFeq2yyRTj
        InAyfhr9xCh2aTI5wfiwC216HmG4la4jHgwOFO0=
X-Google-Smtp-Source: ABdhPJwVlti77EWfKwFUFj+5oXvNJUH6nUaCgGBx6XI2cU/YLWUTzcitP1bPYuJUScKNZkqEyESnFv1GTWBqlgatmRE=
X-Received: by 2002:a05:6a00:174e:b0:43b:80ba:99c8 with SMTP id
 j14-20020a056a00174e00b0043b80ba99c8mr5729403pfc.51.1635443159336; Thu, 28
 Oct 2021 10:45:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6a20:549b:b0:5c:152:538c with HTTP; Thu, 28 Oct 2021
 10:45:59 -0700 (PDT)
Reply-To: mensah.edem@outlook.com
From:   info <redea6405@gmail.com>
Date:   Thu, 28 Oct 2021 17:45:59 +0000
Message-ID: <CAG1wDZ7piuC0AG=KKUXsNdf9LvCEDV7y6Y0hD2gDX0JQhi8k-w@mail.gmail.com>
Subject: =?UTF-8?B?6K+36Zeu5L2g5pS25Yiw5oiR5Y+R57uZ5L2g55qE56ys5LiA5p2h5L+h5oGv5LqG5ZCX?=
        =?UTF-8?B?77yfIFlvdSBzcGVhayBFbmdsaXNoID8gLi4uLg==?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


