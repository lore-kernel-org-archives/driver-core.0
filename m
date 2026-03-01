Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9333101A5
	for <driver-core@lists.linux.dev>; Sun,  1 Mar 2026 12:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772368162; cv=none; b=rip4Q3MjEmfeUMgSiqBoeZPgvJQpuEgsCgxWRHtyWruPXyO8jRgpPhIhnztIXCRW9Tt3V/e3AlB+eUm16Yf0L48EDGV423pWd/hWeMxN/EXZNQTcRyCZI5CA4U3Cg3ae+EpabJfS62aKzWzUqZj73d/GGtTqt9gkWEFvrX5fWTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772368162; c=relaxed/simple;
	bh=uoOvHbI7OulEZmrZegcSJe+eY/h9scoP7mkIZ6KAkmk=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=Xwq9J2ro3NuqhEPCvz2+QFuLqoFagNEvLBJ8KDQluTAWxgsFRfWa2K1VLjfvThxO4nM82DnSe8UaYijeWwWF9Y/YavbGlcGAMW2iQyUJaP++bpRLGABDAoOTcEG+UT1MxYlD9r8geQEHUM9SdE/AlWspxV3sjSVBUqUkR52H1/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OuE22CPd; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OuE22CPd"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48372efa020so28357445e9.2
        for <driver-core@lists.linux.dev>; Sun, 01 Mar 2026 04:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772368159; x=1772972959; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zhoTxHiccHvFWgX0qy2WFpEX8y8xdCAgaJN4O6q+Nus=;
        b=OuE22CPdF7rApbldPGA/5UPc5LsWAr3yXrhTIs+0Fm40SgPVNlp3CGXq/RzfJpquGP
         QXyEGS2VWyF3m/d3+VxspqhaZ+KhGweIS7XKID5DtGxiVFatcz3Abg9O/GerDSIIpuLn
         qurQRnUxjtJQQfHNu8nU2qAxl/4NTOKDZPegMUvfIVGztt2Wg7uup+ctWr/XPYM8cOGD
         9cPciYoDMGrJyyzdv4PABYKTZNmYk3DcowOBR2/4nIcz8lCfDCPO9IYZT9QJR/IYBOkP
         qypDWie1SHI7/cK03or+kKO6XarP3OJiEquglx1sAq1gqL9SRG5pIuEbotqzxMQaOncv
         t8oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772368159; x=1772972959;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zhoTxHiccHvFWgX0qy2WFpEX8y8xdCAgaJN4O6q+Nus=;
        b=vBf4BnJiJvJSS9gctm4GgUCPOTUynsNV5K+Zd9cjBio48lQ9QNHpWED+dWvfYECZ0/
         azxiunzMRYJ3B1nx/9ZE901uobaqbMZa5h3jEybrPk63u7GwlSF6kRKbj96qVLU6nwX0
         HQ0Lp2GV+W5eT5FLqsnTLLxfc/PMQi+qC2YzMsCoZ5l+G6tDkTlNDxBEYxNq4qRFQvvF
         DHZO8pRduaDB2YqVkxLormuiFWlGAe0nQ8u16CGFTzNBt+tWImke7yByfQuZg9BqwXWO
         7fma+vFo01rbbHnNJRJz5jPHnwa2PQBp2AHzeY7oXpVE2W7QhUdB77n/a/yeA/Vjwg8M
         YcaA==
X-Gm-Message-State: AOJu0YzvFwxgaUENyTikn7dwOBbPPlatoZs97Aspzlh91Jaez4BgTCJv
	8Lx8MZlQVbwLGXuouqeRAXnoVneK0kvst7iLm8o13mZ/uDTXMkxBcDKDDlal1Q==
X-Gm-Gg: ATEYQzzZAVWbM9HeWlxGFSSKrBM3i3OCbH3zgUBELzbsWt2/o1tHIKLegaYYQM/+yhC
	29zo6A+GP1v6oHlQscUzYiiGp6871tEKRM4J2hqqi4ZCfVedjxZN4UJMIVqxpSqUkQSKlw55lga
	xelARyCpdscmk7zdXUNsDOnUwC4ewQhwWQXBEyHZeWL/pMwoeGjgRjk98MGKOtqaPaMUss8lgt/
	wXKOXgtczAnlf8whAFM1/sjnu3pBkzLYouzrA+fJaqGaW6i3iMK+Xk2HxxvxLo02G+Fp9+afUKA
	GKCdi+htOYDBkYL6AhJ23QcZuBylxNHioG6Tm26xI/LCYjKQ8lRs+gmjVWP6DDSfksAbP2BeFNK
	UpN34eAwb3ZKMudHao595CXXOF2e55XO703/W6bERs4E+ZJlCQ14bPL1I3zyom2g8Q5Sf9xKMeL
	sSqBWCsIpg7rUI1Bs+IPpiz52YNce6xBSlwmbbVJJXLrkUuXnYEPBT4pRlzDLpsc+WbyopHwG8i
	qlcb9Wszjbm1sUjjGI5vuVPXYqZ00qW6rXiABI5bNwUSJgvUMnZ8T7Q8RCo1RShBQ==
X-Received: by 2002:a05:600c:1f95:b0:45d:f81d:eae7 with SMTP id 5b1f17b1804b1-483c9c100aemr154751935e9.28.1772368158617;
        Sun, 01 Mar 2026 04:29:18 -0800 (PST)
Received: from ?IPV6:2003:ea:8f04:4d00:b8f3:c9fe:a208:3449? (p200300ea8f044d00b8f3c9fea2083449.dip0.t-ipconnect.de. [2003:ea:8f04:4d00:b8f3:c9fe:a208:3449])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd75df90sm353287645e9.14.2026.03.01.04.29.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Mar 2026 04:29:18 -0800 (PST)
Message-ID: <d13ed3da-898e-4b73-a98c-76a671258757@gmail.com>
Date: Sun, 1 Mar 2026 13:29:16 +0100
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: driver-core@lists.linux.dev,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH 0/3] driver core: constify groups arrays in few functions and
 struct class
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

This series constifies the attribute group groups arrays in a number
of functions, and in struct class. This allows to assign constant
arrays, w/o "discards const qualifier" compiler warning.

Heiner Kallweit (3):
  sysfs: constify group arrays in function arguments
  driver: core: constify groups array argument in device_add_groups and
    device_remove_groups
  driver core: make struct class groups members constant arrays

 drivers/base/core.c          |  5 +++--
 fs/sysfs/group.c             | 10 +++++-----
 include/linux/device.h       |  4 ++--
 include/linux/device/class.h |  4 ++--
 include/linux/sysfs.h        | 16 ++++++++--------
 5 files changed, 20 insertions(+), 19 deletions(-)

-- 
2.53.0

