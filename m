Received: from mta0.migadu.com (out-83.mta0.migadu.com [91.218.175.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3073A1D01
	for <driver-core@lists.linux.dev>; Sat, 17 Oct 2026 17:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792257678; cv=none; b=m+25HBGk6oX0SkWT6vQNwZbLpnh0H80JbHwpIZ//lKHmzdOUUTEtg5Sy7Yjt1dxxEIpPC7t8mO9dBJ5aXmyE6tH1ska/Zv04QRO6h1RP/QqQHIvNUwMchrHZpgXtbnlffOzINpQ3tzUaK11Wkxx0QKRtIA7xDqOIbMuhtzd7DdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792257678; c=relaxed/simple;
	bh=rQSiJpdloOLk1IKxcIMyqUygHLmddA2G5OpVAwa/kZM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H6sBG/KQ6M9GPUjmW40BlCuf98uf9qQUgTP5Ndn8o+T1jIDy+7vBWKxMBvJSsyp7qmmWQg4Lo1kFI7H33DqUFI1OTK+B3xN4Td6u9K3B7PhRA1O9LdITho0UtvG1/L6mh6yV5fEpAWXSdkr/rz/9sviKZS7StuBwwVQhpQfEOJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ifiMT4aV; arc=none smtp.client-ip=91.218.175.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ifiMT4aV"
X-Envelope-To: driver-core@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=rQSiJpdloOLk1IKxcIMyqUygHLmddA2G5OpVAwa/kZM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792257673; v=1; x=1792862473;
 b=ifiMT4aV5zslJeySpDz60H+c4cDPTZQ6qSlxrNRIUSwCQvVlxor/779hzsrEu7ittp5dAZTg
 Us+tL6BKg/zNETor3yaCVAYLjerPNLLSB/SDJ/Chn/EH9tKZvsojg1+gxnrTD7Yxm0LKQgmx9gY
 k/Iey0lr8ENEJgfAQp4G7Auw=
X-Envelope-To: driver-core@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id abc17a2e3d72fc6a;
	Sat, 17 Oct 2026 17:21:13 +0000
X-Mizu-Trace-ID: abc17a2e3d72fc6a
X-Migadu-Flow: FLOW_OUT
Date: Sat, 17 Oct 2026 10:21:07 -0700
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Tejun Heo <tj@kernel.org>, Christian Brauner <christian@brauner.io>, 
	Meta kernel team <kernel-team@meta.com>, linux-fsdevel@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] kernfs: allocate inodes and dentry outside
 kernfs_rwsem
Message-ID: <20261017172000.GA204880@shakeel.butt@linux.dev>
References: <20261016220029.3276154-1-shakeel.butt@linux.dev>
 <236f5fe73f01f03d75dddca9362f39a7@kernel.org>
 <2026101745-brisket-outspoken-ef6c@gregkh>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026101745-brisket-outspoken-ef6c@gregkh>

On Sat, Oct 17, 2026 at 11:14:13AM +0200, Greg Kroah-Hartman wrote:
[...]
> 
> This looks sane, but it's really late in the cycle, can we wait until
> after -rc1 to add it to the tree for lots of testing in -next?
> 

Yes, no objection from me.
