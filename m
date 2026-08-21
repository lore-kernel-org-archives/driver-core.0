Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005FC337107;
	Fri, 21 Aug 2026 20:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787342672; cv=none; b=Xrh5Q8eMnJizlBsHIxfZkS/ZgmjrrdKHddpc0UqsHlmkff48xa53/qaHZPHVsHk2MsJIlmFbtfkoEEk8oFmPoFlNEGUW3eX+zqQjQ/bijgQUrhPYJXiI2PC7Gd0S8QXiEn50JuXZi06Sx+JPlKRLRCL4Xb73mpCNdbtwJJckVFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787342672; c=relaxed/simple;
	bh=J2KIgZXArTwu433Ytk0tUCRtOlqBdI9RniVVTSIhfPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pne3tm1KNNl54SzjKWqg6C9417Mu0jVKZPVno2MYUiJgQAcbVjBOLJK5pA5faH0iR8yuWdwq4Y+ch2uUmR4IfSbiXvtge0ZsRXcXhCuGmHl2SrzM7oIkKha5t0KfQC9fNOi/r711dWQgnkTiiQpv+W5epGjvSBxa8/QllOpM6Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oXyR/G3L; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oXyR/G3L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9B851F000E9;
	Fri, 21 Aug 2026 20:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787342670;
	bh=wpREUqwtF0vt74SqKidgVjihHgqdnXY0E19BXW7Na+Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oXyR/G3LHqhpZBm6vAEH++YsQcRKIxFp+V6cMZYcj8Y96hCK+ubzjuDBJ3nXrr6Px
	 2zutvuodGplmy1vq671Ie9DNt8ZyCG/yoeJr6q33gyTVBldC6kSER2yV+xeeMzuDko
	 HAajOCcbjVWfNO2xeHIjIkZ5oOYbmPMRwW32BkBsjTOjO0bNLKwWipg5P31ZLcjHQa
	 cZJfkAoQVsSgTxS4NIDtEy3l2NnS5OHn3IbivDG4m9f1jecj+eAILgmFc/jnd+1pQs
	 hQe5pBxY/yP0Kk851GwuIzfQH31Y5qz4T//m3d8jA/w5p6AzKLLpB501XAWpdZ5s0m
	 SHJlVSqhBYVAA==
Date: Fri, 21 Aug 2026 10:04:29 -1000
From: Tejun Heo <tj@kernel.org>
To: hengyul@cs.unc.edu
Cc: chenyichong@uniontech.com, dakr@kernel.org, gregkh@linuxfoundation.org,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kernfs: preserve security xattrs without allocating
 iattrs
Message-ID: <aoivTe7dgxSkSH_K@slm.duckdns.org>
References: <20260821161221.1270292-1-hengyul@cs.unc.edu>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821161221.1270292-1-hengyul@cs.unc.edu>

Hello,

On Fri, Aug 21, 2026 at 12:12:21PM -0400, hengyul@cs.unc.edu wrote:
> +	return simple_xattr_list(d_inode(dentry),
> +				 attrs ? &attrs->xattrs : NULL, buf, size);

No need for the line break. Otherwise,

Acked-by: Tejun Heo <tj@kernel.org>

Thanks.

-- 
tejun
