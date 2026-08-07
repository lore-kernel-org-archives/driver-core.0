Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F09E27144B
	for <driver-core@lists.linux.dev>; Fri,  7 Aug 2026 02:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786068045; cv=none; b=bHDB0OvADmI9Rm8nVt9dmnWtkttB8ZvwgNzPuF+8K3Xj+kIK5LxwpKtXBBIbl04kJPo008pJYo146Oq42VH5Ux077YpSZdLstlpuCGWYGZLTRzrbQ/KhWRufB3Q85gtcDn21t0xjEYSTyCokHewvcGzb9OpJe6C1ZeidlVkriQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786068045; c=relaxed/simple;
	bh=luT17W6JwPNzDTantNzwihRXEtF33jeNTIpj44YmkoI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Jqszh6pLU7hMv2IqH31KfeoxjBHEWJFggf0VnlnTB6+Q6iPFumEsjgb66aLZrtrIK6q8B0N0sqCKTaT9rD6fBr6JWWnPZhu7MN4nJY0JXxR36lfbDckCyVUSGhcqmYKPJP0xnWB6bKOAj81lgszumbkrUrHeMMx/KCHn/8MCnsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=BkdW5MCO; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="BkdW5MCO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1786067996;
	bh=4jWCOeKhzKyQSZGatSWRuKZpqMiP/H/phhuCeUn8LfQ=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=BkdW5MCO724CHQwdHafvNqfcdntB95QbLAmi+8TXGs+d3/z/HLrJX9Dm0VJTxRr3Y
	 7X2UBEwV4WxA0E0PbxPZKUZ+O16au+P8JKbqgEKPYHB8P7r6erslPw/v+RmSo/Iyf9
	 WgpFDNHatLpDAPOoX0WxWoUSlpwqRz2npSBdz4Vg=
X-QQ-mid: zesmtpsz1t1786067991t016aaab1
X-QQ-Originating-IP: gWtj205Dnnn3MeD16Qvc94piaBh9wxJLKisfZk8ybQk=
Received: from uniontech.com ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 07 Aug 2026 09:59:31 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 3257373749632848062
EX-QQ-RecipientCnt: 13
From: Yichong Chen <chenyichong@uniontech.com>
To: gregkh@linuxfoundation.org
Cc: chenyichong@uniontech.com,
	dakr@kernel.org,
	djakov@kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	quic_mdtipton@quicinc.com,
	rafael@kernel.org,
	vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com
Subject: Re: [PATCH v2 1/3] interconnect: debugfs: replace writable string helper
Date: Fri,  7 Aug 2026 09:59:30 +0800
Message-Id: <20260807015930.1067612-1-chenyichong@uniontech.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <2026080632-delighted-bonsai-18b7@gregkh>
References: <2026080632-delighted-bonsai-18b7@gregkh>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NBfkWSW2HKP7k3cNlFgL724HQYJq5qgwP+1xw51PECVFfyRTKMizkqzy
	HL6a1ouF8eTDTjmWo8TumgFP6aaRAAmKjVzjzbi9SRsY/3w/1xlFdZRhg0Kk7BYaC4MUS6f
	vgvAWMdFSPE5aJGMAE/XVSvOJEJ597HgjUODRDSHB/It5LXELIgYTjzYpxEUHal+efo+Q9K
	Fqf1xf0HLKvLmArWpl1+NDYZ7E0cBLEZAX0Vc3gox+x+J7l7AC0Z5dbTpt2q/Qkg/dQuRmh
	VZLcdZyCyiPyLZ/UJTH3B7fuCkINVtyu8LNEoNgO7vSOeRK6blvCiJAOF12OBCg7DSzKsv0
	UUv4pLp9Z6NCCYEtZ1PDVju1ViXFkKzBkZKYrt85OZdpAzg/Ph3MRbZWz3Uh67qhjEIbsP3
	TSoF3/PmDFk0pGf8NS3RgF7XoBpM3/gIT+OvX9wCgKR7DVgKpgyp5k85waRZi/YmFNPz604
	dKfEC2rBEobjlHeO3ck63ZAJiSiCxg1x76pl+XqNwArXa513MKUOQNAZ81n3nM9DUfHyZLS
	dhCnorAjU3b1gRbTcIDXWrdPNGFjMxTjdPPcjtzU9x0p1m9FiRgQXdJ3pSXaaJfntHQPdcD
	I8HW3hVRSMOzApMENgdxlZ73w5GOlItEQz3TZ3/2EYN58+/n2KITt9oSmVRJ5YbUOkgtlUw
	nY4llbum0wGSPq/hufnHPw97M5zUtN/0TGkWQXijI+byEUKtydGxXox8KdGOdb9a9DpqcvI
	9pTcT43/E4AmTt13D53Cvahx2shGzf8d43tiwWu8ibRE+YpgzfZ1LqfqKJyVLOQ2E5OID1m
	bfQ1NNFh0b+Bz328wQItxKmhBvKFpVjySeZUrdqZ4NvjVzx7nTl+RHGeq0M12PoJXY6c58s
	6+rNIyqVrPciNkOXGVunYeOZE0MGmu5tJDowj1oFFEk50Mni9aSzZnKKkRo7ygJknweP/mK
	Dd4g5eQAKOHPH6bxzUt9D2PKNkOiSg11trf7nr5jkBJhx+J1y9uaRXhx7CsbFbJo7pzPsqK
	LttWpuuomDi5aqgaDm1W+3eCAErCMsHAN+m0BpVdf6UTG8r/bMlwwx9JAGX/4=
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0

On Thu, Aug 06, 2026 at 11:01:07AM +0200, Greg KH wrote:
> On Thu, Aug 06, 2026 at 04:48:52PM +0800, Yichong Chen wrote:
> > +	mutex_lock(&debugfs_lock);
> > +	copy = kstrdup(*node ?: "", GFP_KERNEL);
> > +	mutex_unlock(&debugfs_lock);
> 
> scoped guard?

Yes, scoped guard would be cleaner here.  I can use it in the next version.

> > -	src = kstrdup(src, GFP_ATOMIC);
> > -	dst = kstrdup(dst, GFP_ATOMIC);
> > -	rcu_read_unlock();
> > +	src = kstrdup(src_node, GFP_KERNEL);
> > +	dst = kstrdup(dst_node, GFP_KERNEL);
> 
> Why is GFP_KERNEL now ok, while GFP_ATOMIC wasn't?  Is this the rcu
> stuff interacting somehow?

Yes.  The old code duplicated the strings while still inside the RCU
read-side critical section, so it had to use GFP_ATOMIC.

After this change, src_node and dst_node are protected by debugfs_lock
instead of RCU.  The duplication is done while holding that mutex, so the
allocation can sleep and GFP_KERNEL should be OK.

I will make this clearer in the changelog when sending the next version.

Thanks,
Yichong
