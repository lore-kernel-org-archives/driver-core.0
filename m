Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6DC73328E1
	for <driver-core@lists.linux.dev>; Tue, 27 Jan 2026 09:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769504970; cv=none; b=eYXjUijiftd+UDED79lfaBBuDWCufL9hvfIh79IZoRaDvHk7vfqLjhU2k9YSBaGDnjjT7NmU5FAEnaRftVNXQOGzxVtOjE/8uPgct8Ub4P3FVAJDc530E1wEyY3kAxx3PadJDldbIvNvrERvtuCatJS67mxh31xsNCTtwRVQa5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769504970; c=relaxed/simple;
	bh=fngx/NCf+/N+HScEHfbKqwGhEzf/fUg4MNQWFqsEczE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YWsLCfUlvDmSKzzvWVhV3LlUj5+mbSkp96K8Sma0DrS2DaB8nO/qs4vn0zcPaOEt6qCL1WkyNG1i07a6HbkdzjcKPMsDN8iatj/bhzBT/HW/D7q3okbnBlU80ngpW/dzgrQfkzRsJscu1De2d9+IaDoC5gS7dLnJoHA+uWxrAEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T7To+Ioj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NsG0h8i/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T7To+Ioj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NsG0h8i/"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R7QJGU658517
	for <driver-core@lists.linux.dev>; Tue, 27 Jan 2026 09:09:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vvlvwl1QyFdXJth2eYeA5TIEczP4LPciKUZRTZ+rabE=; b=T7To+IojkhBG8ZEO
	HE6Qoqu0XRQsxt4ddkt51TOn+acN4BA44nEUEqpNUbFCc87saL2AofL3nRqLj8i1
	aQ3BmwQmlgIBzljkIa/CoHWIzFxuccXrGRpx+F7Dvr7F+jaLMbDg/J2eDOJaHnQ/
	iUSjECYtYgkTcXIdFMbU5V6rfQgDZVZGacNh99aPERt07liTUKVZMFNu11Yt4qOO
	srx+CkvrZD6t5L542M/t4zGVzbP6AoDpPMkuVzXKeZUhHy/WgGY3S7nkTZeGbkun
	AmZ/uoXLtmLbExIwQNxlNEm9ghMZ5q3HwcOaCjj1bhlprMi9z7ZOjUmGfO8GT1UQ
	/ChUvw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxryn8ckc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Tue, 27 Jan 2026 09:09:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6a69b7813so1511977385a.0
        for <driver-core@lists.linux.dev>; Tue, 27 Jan 2026 01:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769504966; x=1770109766; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vvlvwl1QyFdXJth2eYeA5TIEczP4LPciKUZRTZ+rabE=;
        b=NsG0h8i/4RA8CBZIj6i5t2bI2ybLnur1kY1lCbGKM76tyELD37+5gkOJgIBLGwBKPt
         27E6TbV1+Xp5+CzirLZMZLDj9W4ICgd1SfWB+vqOPhUi/+C/EaQzBQ+JOoZ4AXLN3rp3
         BTjeAGCI55779mqFtaTwK+aD6tmKSY/5NuA9oQ+INRZGbLtxuvgvzHrGg21TgBhKZdNr
         /K0V0cfASC7B5qkChNalAGEZtUJPIIgWTCNitbwOefgApZseq/xrlHhBHMiNAcb7rQgb
         rHdQ1m7Tju08XPVovr2QFJhQyzpovfjWMENcXwUIattdhezFd8e0rG0Tc2WqAbsg7vV5
         P/QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769504966; x=1770109766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Vvlvwl1QyFdXJth2eYeA5TIEczP4LPciKUZRTZ+rabE=;
        b=PbGsmWYxi7ZyI+Rt7wt3WDiPeLQymVoCZUHCDU/6HU0YLKAKV811h9rckVPQ/HhLEf
         V97ICghCqXTbZgQT2MimfwQT+GMhLTy1WZbpmES/uwjck/YVG0pa01y4jEIDehXEWZuI
         ji3/0SFP0HFHoZiGpkzYI+HBdSfBuAv761+UxisROLpLhXubSrUQKZchdm/WZeS1RLSl
         UTg1lV7bufWLlC7Kc+65eW8JO1CZ52j2V9b1WHUsc6/NS/C8tEG1giayfwzgwolkL6xW
         Ce7/sBtTh/BIQOIMGmLowTMzXRM+lYxf7i2zN1KDfY2a0+KElKUD+ZvzBZfhpZCCyYER
         yIXw==
X-Forwarded-Encrypted: i=1; AJvYcCXxe92L8raGa2XIMFBeekDN5jO0WH3rLNebPr46oM6zKIV7KkqvCTF8YjpWkrGQwkWxYEGYATTuMKY33w==@lists.linux.dev
X-Gm-Message-State: AOJu0YyI5BbqdZzDAN9XPcF1WRxKEHFYx7Y3/YnQ6YqCl2XwAqnmy0wR
	LSuSihTHJwXDvo5L+CMTi0yo0JntFZ+iffANs/y896VZl2gy2SWDPsaRsHqLo6BdiaYBUEBLvYw
	4DLul0zwzDcU0kXGvTFZ/innSqDxXBkE7XPxHCwveWIS89g2K4ErPRnlgjfakYV82/Q==
X-Gm-Gg: AZuq6aLQBwuizUzQNZ/l3XmWOFXPx13wR9wsMRniMgHfH7bdn+mzJGdgBR6Sj0uGPNB
	k/JcfNWBI93ogUwiDt+unEsl763U4a8xxYbvCQqEBNnPpVpc3RMqtY1TVA/zqJJbGgAnizc/Tzc
	cGjpxjIhzSKhhOmaSWBrAc2q+58Srw9nG0X+ronZ6oiH1uytnnwkL4w54nJ1MvDLRtmcfOhLD/c
	lDb6ZMmt36BDupxoqtoOqp+YT1dhY4EbRKtGB23p693koiSEBYVJl/Ad2WHgLqI/9JFxZBACGsK
	RZaxTXlfHq6jpkUa/2EBXEikkdRQ+Cts2MNdRQt8Ld9vMSG9d84sOd9aZENM6WcTFleKtj7j0SQ
	2Q/NaswYksXwtEqv2kekHYVJcpRq/4AHASuJ4ng==
X-Received: by 2002:a05:620a:46a9:b0:8b2:e827:14bc with SMTP id af79cd13be357-8c70b8e5f77mr100445785a.56.1769504966113;
        Tue, 27 Jan 2026 01:09:26 -0800 (PST)
X-Received: by 2002:a05:620a:46a9:b0:8b2:e827:14bc with SMTP id af79cd13be357-8c70b8e5f77mr100444185a.56.1769504965631;
        Tue, 27 Jan 2026 01:09:25 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:262e:d32a:e347:8b74])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804db7b434sm128163345e9.4.2026.01.27.01.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 01:09:25 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: gregkh@linuxfoundation.org, rafael@kernel.org, broonie@kernel.org,
        will@kernel.org, grygorii.strashko@ti.com, ssantosh@kernel.org,
        khilman@kernel.org, linusw@kernel.org, brgl@kernel.org,
        Danilo Krummrich <dakr@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: omap: do not register driver in probe()
Date: Tue, 27 Jan 2026 10:09:16 +0100
Message-ID: <176950495232.13307.15142034347404555496.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260123133614.72586-1-dakr@kernel.org>
References: <20260123133614.72586-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: IFm4TE-dL1TN5pTauf3C6j77WEmYTdH8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA3NCBTYWx0ZWRfX3zZYjcf5JYPy
 W4YcEOo6bPg+1Q7ioFA+kOfhuPl/w89/M1k8KbjQOyHv/zC3WwDINeBpoH0AEqo2MgrgCvrOLIU
 xpVazOI6Ec+QQ1Gb/0KpYPEfc09lFCipEMU/uLBRIu5cyh5ECzobQUTnA8vnVLjX6YVXptGcm6g
 EZzShis9qKr4XLep3SY23l0dxQxG/BjXLSjMtGr2SS883XnQuYqHbsl1d1Ja//uA9BR+JXGbOFH
 FP+z1gi+otzLjTef5MtN9eCJ9d+PBSW4fW4aB9VV1Ku01B4+sDBNIDqLp8QUT4VI8RHGiw3T7Pr
 1s0QxzlBjY5EB3onUN/In/4mUQvYAJIx8i86fbS4EqLP/sAFAZGfkFEVsJ6ThZLjWkoBvgNDPlY
 sirjvsrmZ2Q8VfO3OxLyfVEqFGDtXDx95xDmtxfRONJYlMH7/UMe9iyiiP2wjzq+OFut57VYRl1
 ErpH5NU6rJxa87ww7/g==
X-Proofpoint-GUID: IFm4TE-dL1TN5pTauf3C6j77WEmYTdH8
X-Authority-Analysis: v=2.4 cv=FsEIPmrq c=1 sm=1 tr=0 ts=697880c7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=StneJEbOKPblmvvYeVQA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_01,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0 clxscore=1011
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601270074


On Fri, 23 Jan 2026 14:31:56 +0100, Danilo Krummrich wrote:
> Commit 11a78b794496 ("ARM: OMAP: MPUIO wake updates") registers the
> omap_mpuio_driver from omap_mpuio_init(), which is called from
> omap_gpio_probe().
> 
> However, it neither makes sense to register drivers from probe()
> callbacks of other drivers, nor does the driver core allow registering
> drivers with a device lock already being held.
> 
> [...]

Applied, thanks!

[1/1] gpio: omap: do not register driver in probe()
      commit: 3cb53b083fa665ec14c52962f50b9c1df48cf87b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
