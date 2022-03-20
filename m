Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F289E4E19FF
	for <lists+linux-samsung-soc@lfdr.de>; Sun, 20 Mar 2022 06:41:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244738AbiCTFmj (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sun, 20 Mar 2022 01:42:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234851AbiCTFmi (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 20 Mar 2022 01:42:38 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 722E689CC1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 19 Mar 2022 22:41:15 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id v130-20020a1cac88000000b00389d0a5c511so8671354wme.5
        for <linux-samsung-soc@vger.kernel.org>; Sat, 19 Mar 2022 22:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:from:mime-version:content-transfer-encoding
         :content-description:subject:to:date:reply-to;
        bh=nHz08v+KGykef/EY5wszhlvcWuKfz0UE0QFNYs1Ac5U=;
        b=FtYdHqyFWOOYb6sMZeH6Q7Uc9fn5A1uhPIC/KUvfRtfOfoLqtGmE7HaSHHPiOP8vMT
         gcLRmRFGi1ZFWBB26d4sYSnHc2DJldadZVG8YPxVoo7T/mXQNBrXuMg8qDnk/BkJCVv/
         K4asB7J2OWXqG7ELR6HcSOV/ExA7fo57jsxdjWogwC3WOMB3oCbeGwXCDxjogvI6z1F9
         rprkYjHpuc0VzuRnGAi7+zNOe+LRg8DnGHlSuBhYLYomPZsfsnVjRO5JX1wezJznmR4x
         9ZZCLLGayEvGzTQR0nSkxVLFejRy2oLewMkpb9AvfqI2wRLd93rCCl7KOpjffFL1SqM3
         s0GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:from:mime-version
         :content-transfer-encoding:content-description:subject:to:date
         :reply-to;
        bh=nHz08v+KGykef/EY5wszhlvcWuKfz0UE0QFNYs1Ac5U=;
        b=gIXD8KQmnKE1kkyBOR5dQ1O+Y1gZPPjNI9tv80SkEQM1sbkQH5b6lPK2gNnCW4wcq5
         RSkdKIcVt/WhKGCo9Su9uw1USfQouqflEki+/Omfb75HHhocg/KAKc95OM7H6X1HJhfI
         OPFX2uJ+BMi2iH8sJ9Zpq3HiLiFrigQfZFHRJGhZpIZQt4QKzN9R/HEA4MHwGJluBZ3m
         t9oBk3tHv/UcjaOvfIzzy9yH2BZ1KbBapUHWTi76sopOABk0t5DUfSQrYvWqB4dm1nSQ
         CL9F/EmzPDQNlm8w5RbjjwshQiByv+TWM9ohUycFXUDn88FduFcm7K82idlfyrk0CZun
         XqRg==
X-Gm-Message-State: AOAM532wkeiiaFH2EjuE0FS3aZJ+OhUOezQkRk5V0KnBnnNpM/J7eBbO
        SZIoI2dpliY+JIO3YBH8g9XO8rPQu3kvog==
X-Google-Smtp-Source: ABdhPJy1kqoiwLaxtcRQe0v8MzhK9RuhxxnuFNVq/HdaRmiGTERb4AiGCW/6neHEuaFyKM4RjYbWgw==
X-Received: by 2002:a05:600c:1da5:b0:38c:9951:fa9f with SMTP id p37-20020a05600c1da500b0038c9951fa9fmr3658334wms.11.1647754873729;
        Sat, 19 Mar 2022 22:41:13 -0700 (PDT)
Received: from [192.168.0.111] ([196.171.25.64])
        by smtp.gmail.com with ESMTPSA id i74-20020adf90d0000000b0020373ba7beesm14440322wri.0.2022.03.19.22.41.09
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 19 Mar 2022 22:41:13 -0700 (PDT)
Message-ID: <6236be79.1c69fb81.cebb7.7f33@mx.google.com>
From:   "Vanina C." <curtisvani0097@gmail.com>
X-Google-Original-From: Vanina C.
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Regards to you
To:     Recipients <Vanina@vger.kernel.org>
Date:   Sun, 20 Mar 2022 05:41:00 +0000
Reply-To: curtisvani9008@gmail.com
X-Spam-Status: No, score=2.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,TO_MALFORMED,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Greetings, I'm Vanina C. how are you my dear, Kindly respond to me, it's my=
 pleasure to meet you, hope we can establish a relationship from here.
