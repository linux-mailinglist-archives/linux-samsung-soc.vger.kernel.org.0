Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 608EF6EC485
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 24 Apr 2023 06:48:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230437AbjDXEsx (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 24 Apr 2023 00:48:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230466AbjDXEsu (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 24 Apr 2023 00:48:50 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E2DC30D0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Apr 2023 21:48:48 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-51fcf5d1e44so4171379a12.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Apr 2023 21:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682311727; x=1684903727;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oDVdWICwavrWQ8UAVYhe8ynFXsBBW1vVQ7W08zgiq24=;
        b=fAia1JrsDNPuORO54FZIhIfSX+74ikzEvu2GZeT7VNgNCtgRXHIq1CiT6m6uUGzZHk
         mqLxN3dsSCJURqMRQtBSPCLmK26PBAZYnAxc+O/Q57yk+G/gBIEaijP1UDVMzRxK7J6P
         sXinzAu4wUoPTdXKUgRAheU4rhcYDgKO7N3FMOPn5AD+RrsNG8xYShgfwaBsFbslR72P
         pRgbMCdOtP6DF73kCA+ac9YY4cuoaksKWN2AJ88bDiK86meX1sw43flNTD5tlZOT/gkq
         BmRX74wTSs/jfBUUez+s8rto7EaaqSlah/TW939G6eaIV4azhY3DApyC+HKfcF7GrhCz
         T2DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682311727; x=1684903727;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oDVdWICwavrWQ8UAVYhe8ynFXsBBW1vVQ7W08zgiq24=;
        b=ipUAXKQevTF+EEmTjne5fTyMqZ+NwkExdg+YnX2j5Us3yZk9f2OTMELNxK24m93cBd
         61LvqnqQVNvoQ9j/vDZbYktqSfv2/X0hWD84YgaLI1JXswBzMGybPiIewZVEJu2y08HO
         6s0YPMzZx/sfcQ7w12nI+8PYR+5RcCTDA3bVghIhG3USTmkvpSgV1QVacjY7xGUYL17R
         AjhZY6YqYMB1x6P4KsGgHKmfkLFtiOu/Hm7KhwoB/pw4kEE7iMhLL1ndNk9VVEJNJMTT
         Y5KfdGoPff5l75r70BkzncFBLQifex/b2Gro8YzMxTTsUO1WUcUplWiPwth9Yzj36KwE
         K2/A==
X-Gm-Message-State: AAQBX9fL15Jod/qIPunPYrJBdtZkXxT8UiZA6c8kyLEYKXactoZnxhNg
        Ui/qEPIoHIbTLWdeHVuM4YSU95zNYhaX7U3GLjoxggRms81qCg==
X-Google-Smtp-Source: AKy350YJzZ5+IIvJAdxwKOuVIP4WxWbQznyy+taH7e4DsVrKz0J+QW4cFc1Tm4mAlBtjUsAjg4gCk5xK/0NPd8JLc7Y=
X-Received: by 2002:a17:90a:d246:b0:246:e9ab:aca5 with SMTP id
 o6-20020a17090ad24600b00246e9abaca5mr12098327pjw.18.1682311727415; Sun, 23
 Apr 2023 21:48:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6a10:234e:b0:49c:a5fa:37b5 with HTTP; Sun, 23 Apr 2023
 21:48:46 -0700 (PDT)
Reply-To: ninacoulibaly03@hotmail.com
From:   nina coulibaly <ninacoulibaly004@gmail.com>
Date:   Sun, 23 Apr 2023 21:48:46 -0700
Message-ID: <CANcht-Qp+zWHxi4mfh21bWnK828o_HNMVyPf7Zi3rKKaa6=sww@mail.gmail.com>
Subject: from nina coulibaly
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=2.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Dear,

I am interested to invest with you in your country with total trust
and i hope you will give me total support, sincerity and commitment.
Please get back to me as soon as possible so that i can give you my
proposed details of funding and others.

Best Regards.

Mrs Nina Coulibaly
